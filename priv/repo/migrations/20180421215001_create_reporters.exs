defmodule PhxApi.Repo.Migrations.CreateReporters do
  use Ecto.Migration

  def change do
    create table(:reporters) do
      add :uuid, :string
      add :source_id, references(:sources, on_delete: :nothing)

      timestamps()
    end

    create index(:reporters, [:source_id])
  end
end
