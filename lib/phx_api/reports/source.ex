defmodule PhxApi.Reports.Source do
  use Ecto.Schema
  import Ecto.Changeset


  schema "sources" do
    field :name, :string
    field :token, :string

    timestamps()
  end

  @doc false
  def changeset(source, attrs) do
    source
    |> cast(attrs, [:name, :token])
    |> validate_required([:name, :token])
  end
end
