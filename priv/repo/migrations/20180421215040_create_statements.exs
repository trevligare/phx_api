defmodule PhxApi.Repo.Migrations.CreateStatements do
  use Ecto.Migration

  def change do
    create table(:statements) do
      add :text, :text
      add :nice, :boolean, default: false, null: false
      add :reporter_id, references(:reporters, on_delete: :nothing)

      timestamps()
    end

    create index(:statements, [:reporter_id])
  end
end
