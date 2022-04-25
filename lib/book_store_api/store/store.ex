defmodule BookStoreApi.Store do
  import Ecto.Query, warn: false
  alias BookStoreApi.Repo

  alias BookStoreApi.Store.{Reviews, Books, Author}

  def list_books do
    Books
    |> Repo.all()
    |> case do
      [] -> {:error, "No Books yet!"}
      [_ | _] = books -> {:ok, books}
    end
  end

  def get_book!(%{id: id}) do
    Books
    |> Repo.get!(id)
  end

  def create_book(attrs \\ %{}) do
    %Books{}
    |> Books.changeset(attrs)
    |> Repo.preload(:reviews)
    |> Repo.insert()
  end

  def update_book(%Books{} = book, attrs) do
    book
    |> Books.changeset(attrs)
    |> Repo.update()
  end

  def delete_book(%Books{} = book) do
    Repo.delete(book)
  end

  def change_book(%Books{} = book, attrs \\ %{}) do
    Books.changeset(book, attrs)
  end

  ## Review Functions
  @spec list_reviews :: {:error, <<_::104>>} | {:ok, nonempty_maybe_improper_list}
  def list_reviews do
    Reviews
    |> Repo.all()
    |> case do
      [] -> {:error, "No Books yet!"}
      [_ | _] = reviews -> {:ok, reviews}
    end
  end

  def get_review!(id), do: Repo.get!(Review, id)

  def create_review(attrs \\ %{}) do
    %Reviews{}
    |> Reviews.changeset(attrs)
    |> Repo.insert()
  end

  def update_review(%Reviews{} = review, attrs) do
    review
    |> Reviews.changeset(attrs)
    |> Repo.update()
  end

  def delete_review(%Reviews{} = review) do
    Repo.delete(review)
  end

  def change_review(%Reviews{} = review) do
    Reviews.changeset(review, %{})
  end

  @spec get_book_with_review(%{:id => any, optional(any) => any}) ::
          nil | [%{optional(atom) => any}] | %{optional(atom) => any}
  def get_book_with_review(%{id: id}) do
    Repo.get!(Books, id)
    |> Repo.preload(:reviews)
  end

  #### author Context

  def list_authors do
    Author
    |> Repo.all()
    |> Repo.preload(:books)
    |> case do
      [] -> {:error, "No Authors yet!"}
      [_ | _] = author -> {:ok, author}
    end
  end

  def get_author!(%{id: id}) do
    Author
    |> Repo.get!(id)
  end

  def create_author(attrs \\ %{}) do
    %Author{}
    |> Author.changeset(attrs)
    |> Repo.insert()
  end

  def update_author(%Author{} = author, attrs) do
    author
    |> Author.changeset(attrs)
    |> Repo.update()
  end

  def delete_author(%Author{} = author) do
    author
    |> Repo.delete()
  end
end
