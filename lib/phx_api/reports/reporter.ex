defmodule PhxApi.Reporter do
  use Ecto.Schema
  import Ecto.Changeset


  schema "reporters" do
    field :uuid, :string
    field :source_id, :id

    timestamps()
  end

  @doc false
  def changeset(reporter, attrs) do
    reporter
    |> cast(attrs, [:uuid])
    |> validate_required([:uuid])
  end
end
