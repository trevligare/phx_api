defmodule PhxApiWeb.ReportController do
  use PhxApiWeb, :controller

  alias PhxApi.Reports
  alias PhxApi.Reports.{Report, Source, Statement}

  action_fallback PhxApiWeb.FallbackController

  def create(conn, report_params) do
    # {:ok, %Reporter{} = reporter} <- Reports.find_or_create_reporter(report_params)
    # {:ok, %Statement{} = statement} <- Reports.create_statement(report_params) do
    with {:ok, %Source{} = source} <- Reports.authorize(report_params["token"]) do
      conn
      |> put_status(:created)
      |> json %{id: 0}
    end
  end
end
