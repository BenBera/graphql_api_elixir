defmodule BookStoreApi.Store.Books do
  use Ecto.Schema
  import Ecto.Changeset

  # @primary_key {:id, :binary_id, autogenerate: true}
  # @foreign_key_type :inter
  schema "books" do
    field :title, :string
    field :description, :string
    field :isbn, :string
    field :price, :float
    field :author_id, :integer

    has_many(:reviews, BookStoreApi.Store.Reviews)

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :isbn, :description, :price, :author_id])
    |> validate_required([:title, :isbn, :description, :price, :author_id])
    |> unique_constraint(:isbn)
  end
end
