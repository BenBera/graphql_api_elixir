defmodule BookStoreApi.Store.Author do
  use Ecto.Schema
  import Ecto.Changeset

  schema "authors" do
    field :name, :string
    field :age, :integer
    field :city, :string

    has_many(:books, BookStoreApi.Store.Books)

    timestamps()
  end

  def changeset(authors, attrs) do
    authors
    |> cast(attrs, [:name, :age, :city])
    |> validate_required([:name, :age])
  end

  
end
