defmodule BookStoreApi.Store.Reviews do

  use Ecto.Schema
  import Ecto.Changeset
  # alias BookStoreApi.Store.Books

  schema "reviews" do
    field(:books_id, :integer)
    field(:comment, :string)

    #  belongs_to(:book, Books)

    timestamps()
  end

  @doc false
  def changeset(review, attrs) do
    review
    |> cast(attrs, [:comment, :books_id])
    |> validate_required([:comment, :books_id])
  end
end
