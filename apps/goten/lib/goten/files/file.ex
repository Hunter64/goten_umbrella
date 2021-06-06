defmodule Goten.Files.File do
  use Ecto.Schema
  import Ecto.Changeset

  schema "files" do
    field :content, :binary
    field :file_id, Ecto.UUID
    field :name, :string
    field :user, :integer

    timestamps()
  end

  @doc false
  def changeset(file, attrs) do
    file
    |> cast(attrs, [:file_id, :content, :name, :user])
    |> validate_required([:file_id, :content, :name, :user])
  end
end
