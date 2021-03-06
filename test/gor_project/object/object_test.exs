defmodule GORproject.ObjectTest do
  use GORproject.DataCase

  alias GORproject.Object

  describe "characters" do
    alias GORproject.Object.Character

    @valid_attrs %{characteristics: "some characteristics", hash: "7488a646-e31f-11e4-aace-600308960662", name: "some name"}
    @update_attrs %{characteristics: "some updated characteristics", hash: "7488a646-e31f-11e4-aace-600308960668", name: "some updated name"}
    @invalid_attrs %{characteristics: nil, hash: nil, name: nil}

    def character_fixture(attrs \\ %{}) do
      {:ok, character} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Object.create_character()

      character
    end

    test "list_characters/0 returns all characters" do
      character = character_fixture()
      assert Object.list_characters() == [character]
    end

    test "get_character!/1 returns the character with given id" do
      character = character_fixture()
      assert Object.get_character!(character.id) == character
    end

    test "create_character/1 with valid data creates a character" do
      assert {:ok, %Character{} = character} = Object.create_character(@valid_attrs)
      assert character.characteristics == "some characteristics"
      assert character.hash == "7488a646-e31f-11e4-aace-600308960662"
      assert character.name == "some name"
    end

    test "create_character/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Object.create_character(@invalid_attrs)
    end

    test "update_character/2 with valid data updates the character" do
      character = character_fixture()
      assert {:ok, character} = Object.update_character(character, @update_attrs)
      assert %Character{} = character
      assert character.characteristics == "some updated characteristics"
      assert character.hash == "7488a646-e31f-11e4-aace-600308960668"
      assert character.name == "some updated name"
    end

    test "update_character/2 with invalid data returns error changeset" do
      character = character_fixture()
      assert {:error, %Ecto.Changeset{}} = Object.update_character(character, @invalid_attrs)
      assert character == Object.get_character!(character.id)
    end

    test "delete_character/1 deletes the character" do
      character = character_fixture()
      assert {:ok, %Character{}} = Object.delete_character(character)
      assert_raise Ecto.NoResultsError, fn -> Object.get_character!(character.id) end
    end

    test "change_character/1 returns a character changeset" do
      character = character_fixture()
      assert %Ecto.Changeset{} = Object.change_character(character)
    end
  end
end
