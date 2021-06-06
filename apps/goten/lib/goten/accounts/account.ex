defmodule Goten.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset

  schema "accounts" do
    field :active, :boolean, default: false
    field :code, :string
    field :creator_user_id, :integer
    field :description, :string
    field :modifier_user_id, :integer
    field :name, :string
    field :nature, :string

    timestamps()
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:code, :name, :description, :nature, :active, :creator_user_id, :modifier_user_id])
    |> validate_required([:code, :name, :description, :nature, :active, :creator_user_id])
  end
end
