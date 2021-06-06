defmodule Goten.Repo.Migrations.CreateFiles do
  use Ecto.Migration

  def change do
    create table(:files) do
      add :file_id, :uuid
      add :content, :binary
      add :name, :string
      add :user, :integer

      timestamps()
    end

  end
end
