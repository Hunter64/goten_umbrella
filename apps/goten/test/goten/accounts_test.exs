defmodule Goten.AccountsTest do
  use Goten.DataCase

  alias Goten.Accounts

  describe "accounts" do
    alias Goten.Accounts.Account

    @valid_attrs %{active: true, code: "some code", creator_user_id: 42, description: "some description", modifier_user_id: 42, name: "some name", nature: "some nature"}
    @update_attrs %{active: false, code: "some updated code", creator_user_id: 43, description: "some updated description", modifier_user_id: 43, name: "some updated name", nature: "some updated nature"}
    @invalid_attrs %{active: nil, code: nil, creator_user_id: nil, description: nil, modifier_user_id: nil, name: nil, nature: nil}

    def account_fixture(attrs \\ %{}) do
      {:ok, account} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_account()

      account
    end

    test "list_accounts/0 returns all accounts" do
      account = account_fixture()
      assert Accounts.list_accounts() == [account]
    end

    test "get_account!/1 returns the account with given id" do
      account = account_fixture()
      assert Accounts.get_account!(account.id) == account
    end

    test "create_account/1 with valid data creates a account" do
      assert {:ok, %Account{} = account} = Accounts.create_account(@valid_attrs)
      assert account.active == true
      assert account.code == "some code"
      assert account.creator_user_id == 42
      assert account.description == "some description"
      assert account.modifier_user_id == 42
      assert account.name == "some name"
      assert account.nature == "some nature"
    end

    test "create_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_account(@invalid_attrs)
    end

    test "update_account/2 with valid data updates the account" do
      account = account_fixture()
      assert {:ok, %Account{} = account} = Accounts.update_account(account, @update_attrs)
      assert account.active == false
      assert account.code == "some updated code"
      assert account.creator_user_id == 43
      assert account.description == "some updated description"
      assert account.modifier_user_id == 43
      assert account.name == "some updated name"
      assert account.nature == "some updated nature"
    end

    test "update_account/2 with invalid data returns error changeset" do
      account = account_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_account(account, @invalid_attrs)
      assert account == Accounts.get_account!(account.id)
    end

    test "delete_account/1 deletes the account" do
      account = account_fixture()
      assert {:ok, %Account{}} = Accounts.delete_account(account)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_account!(account.id) end
    end

    test "change_account/1 returns a account changeset" do
      account = account_fixture()
      assert %Ecto.Changeset{} = Accounts.change_account(account)
    end
  end
end
