defmodule BookStoreApiWeb.Resolvers.BooksResolver do
  alias BookStoreApi.Store.{Books, Reviews, Author}
  alias BookStoreApi.Store

  def list_all_books(_, _, _), do: Store.list_books()

  def one_book(_, %{id: id}) do
    with {:ok, %Books{} = book} <- Store.get_book!(id) do
      {:ok, %{book: book}}
    end
  end

  def create_book(_, %{input: params}, _) do
    with {:ok, %Books{} = books} <- Store.create_book(params) do
      {:ok, %{books: books}}
    end
  end

  def update_book(_, %{input: params}, _) do
    with {:ok, %Books{} = books} <- Store.update_book(params) do
      {:ok, %{books: books}}
    end
  end

  def delete_book(_, %{id: id}, _) do
    with {:ok, %Books{} = books} <- Store.delete_book(id) do
      {:ok, %{books: books}}
    end
  end

  # reviews

  def list_all_reviews(_, _, _), do: Store.list_reviews()

  def create_review(_, %{input: params}, _) do
    with {:ok, %Reviews{} = reviews} <- Store.create_review(params) do
      {:ok, %{reviews: reviews}}
    end
  end

  def update_review(_, %{input: params}, _) do
    with {:ok, %Reviews{} = reviews} <- Store.update_review(params) do
      {:ok, %{reviews: reviews}}
    end
  end

  def delete_review(_, %{iid: id}, _) do
    with {:ok, %Reviews{} = reviews} <- Store.delete_review(id) do
      {:ok, %{reviews: reviews}}
    end
  end

  # authors

  def list_all_authors(_, _, _), do: Store.list_authors()

  def create_author(_, %{input: params}, _) do
    with {:ok, %Author{} = authors} <- Store.create_author(params) do
      {:ok, %{authors: authors}}
    end
  end

  def one_author(_, %{id: id}) do
    with {:ok, %Author{} = author} <- Store.get_author!(id) do
      {:ok, %{author: author}}
    end
  end

  def delete_author(_, %{id: id}) do
    with {:ok, %Author{} = author} <- Store.delete_author(id) do
      {:ok, %{author: author}}
    end
  end

  def update_author(_, %{input: params}) do
    with {:ok, %Author{} = author} <- Store.update_author(params) do
      {:ok, %{author: author}}
    end
  end
end
