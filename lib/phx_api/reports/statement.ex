defmodule PhxApi.Reports.Statement do
  use Ecto.Schema
  import Ecto.Changeset


  schema "statements" do
    field :nice, :boolean, default: false
    field :text, :string
    field :reporter_id, :id

    timestamps()
  end

  @doc false
  def changeset(statement, attrs) do
    statement
    |> cast(attrs, [:text, :nice])
    |> validate_required([:text, :nice])
  end
end
