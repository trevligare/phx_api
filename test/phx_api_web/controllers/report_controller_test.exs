defmodule PhxApiWeb.ReportControllerTest do
  use PhxApiWeb.ConnCase

  alias PhxApi.Reports
  alias PhxApi.Reports.Report

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:report) do
    {:ok, report} = Reports.create_report(@create_attrs)
    report
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all reports", %{conn: conn} do
      conn = get conn, report_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create report" do
    test "renders report when data is valid", %{conn: conn} do
      conn = post conn, report_path(conn, :create), report: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, report_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, report_path(conn, :create), report: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update report" do
    setup [:create_report]

    test "renders report when data is valid", %{conn: conn, report: %Report{id: id} = report} do
      conn = put conn, report_path(conn, :update, report), report: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, report_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, report: report} do
      conn = put conn, report_path(conn, :update, report), report: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete report" do
    setup [:create_report]

    test "deletes chosen report", %{conn: conn, report: report} do
      conn = delete conn, report_path(conn, :delete, report)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, report_path(conn, :show, report)
      end
    end
  end

  defp create_report(_) do
    report = fixture(:report)
    {:ok, report: report}
  end
end
