defmodule PhxApi.Reports.Report do
  use Ecto.Schema
  import Ecto.Changeset
  
  @primary_key false

  embedded_schema do
    field :token, :string
    field :reporter, :string
    field :nice, :string
    field :text, :string
  end


  def new(params), do: changeset(params)

  defp changeset(params) do
    %__MODULE__{}
    |> cast(params, ~w(token reporter nice text)a)
    |> apply_changes()
  end
end
