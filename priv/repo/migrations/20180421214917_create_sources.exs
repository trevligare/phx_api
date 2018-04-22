defmodule PhxApi.Repo.Migrations.CreateSources do
  use Ecto.Migration

  def change do
    create table(:sources) do
      add :name, :string
      add :token, :string

      timestamps()
    end

  end
end
