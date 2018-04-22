defmodule PhxApi.Reports do
  @moduledoc """
  The Reports context.
  """

  import String
  import Ecto.Query, warn: false
  alias PhxApi.Repo
  alias PhxApi.Reports.{Report, Statement, Source}


  def authorize(token) do
    source = parse_token(token)
    if source do
      {:ok, source}
    else
      {:error, :forbidden}
    end
  end
  defp parse_token(nil), do: {:error, "token is required"}
  defp parse_token(token), do: Repo.get_by(Source, token: token)
  

  @doc """
  Creates a report.

  ## Examples

      iex> create_report(%{token: token, reporter: reporter, text: text, nice: nice})
      {:ok, %Report{}}

      iex> create_report(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  # def create_report(attrs \\ %{}) do
  #   IO.puts "create_report"
  #   %Report{attrs}
  #   |> Report.changeset(attrs)
  #
  #   {:ok}
  # end

  #
  # def create(params) do
  #     with {:ok, source} <- parse_source(params["token"]),
  #          {:ok, reporter} <- parse_reporter(params["reporter"]),
  #          {:ok, text} <- parse_text(params["text"]),
  #          {:ok, nice} <- parse_nice(params["nice"])
  #     do
  #       %find_source{source: source, text: text}
  #     else
  #       # nil -> {:error, ...} an example that we can match here too
  #       err -> err
  #     end
  #   end
  #
  #   defp parse_token(nil), do: {:error, "token is required"}
  #   defp parse_token(token) when String.valid?(token), do: {:ok, token}
  #   defp parse_token(_invalid), do: {:error, "token must be an integer"}
  #   defp get_source(token) do
  #     token
  #     |> parse_token
  #   end
  #
  #   defp parse_nice(nil), do: {:error, "nice is required"}
  #   defp parse_nice(nice) when is_integer(nice), do: {:ok, nice}
  #   defp parse_nice(_invalid), do: {:error, "nice must be an integer"}
  #
  #   defp parse_text(nil), do: {:error, "text is required"}
  #   defp parse_text(""), do: parse_text(nil)
  #   defp parse_text(text), do: {:ok, text}
  #




  #
  #
  # @doc """
  # - Returns the list of reports.
  # - Examples
  #     iex> list_reports()
  #     [%Report{}, ...]
  # """
  # def list_reports do
  #   Repo.all(Report)
  # end
  #
  # @doc """
  # - Gets a single report.
  # - Raises `Ecto.NoResultsError` if the Report does not exist.
  # - Examples
  #     iex> get_report!(123)
  #     %Report{}
  #     iex> get_report!(456)
  #     ** (Ecto.NoResultsError)
  # """
  # def get_report!(id), do: Repo.get!(Report, id)
  #
  # @doc """
  # - Creates a report.
  # - Examples
  #     iex> create_report(%{field: value})
  #     {:ok, %Report{}}
  #     iex> create_report(%{field: bad_value})
  #     {:error, %Ecto.Changeset{}}
  # """
  # def create_report(attrs \\ %{}) do
  #   %Report{}
  #   |> Report.changeset(attrs)
  #   |> Repo.insert()
  # end
  #
  # @doc """
  # - Updates a report.
  # - Examples
  #     iex> update_report(report, %{field: new_value})
  #     {:ok, %Report{}}
  #     iex> update_report(report, %{field: bad_value})
  #     {:error, %Ecto.Changeset{}}
  # """
  # def update_report(%Report{} = report, attrs) do
  #   report
  #   |> Report.changeset(attrs)
  #   |> Repo.update()
  # end
  #
  # @doc """
  # - Deletes a Report.
  # - Examples
  #     iex> delete_report(report)
  #     {:ok, %Report{}}
  #     iex> delete_report(report)
  #     {:error, %Ecto.Changeset{}}
  # """
  # def delete_report(%Report{} = report) do
  #   Repo.delete(report)
  # end
  #
  # @doc """
  # - Returns an `%Ecto.Changeset{}` for tracking report changes.
  # - Examples
  #     iex> change_report(report)
  #     %Ecto.Changeset{source: %Report{}}
  # """
  # def change_report(%Report{} = report) do
  #   Report.changeset(report, %{})
  # end
end
