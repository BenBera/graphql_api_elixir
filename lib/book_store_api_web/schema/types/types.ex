defmodule BookStoreApiWeb.Schema.Types do
  use Absinthe.Schema.Notation
  alias BookStoreApiWeb.Resolvers.BooksResolver

  object :author do
    field :name, :string
    field :age, :string
    field :city, :string
  end

  object :author_with_books do
    field :name, :string
    field :age, :string
    field :city, :string
    field :books, list_of(:books)
  end

  object :all_books do
    field :authors, list_of(:author)
    field :description, :string
    field :isbn, :string
    field :price, :float
    field :title, :string
  end

  object :books do
    field :description, :string
    field :isbn, :string
    field :price, :float
    field :title, :string
    field :author_id, :integer
  end

  object :create_book do
    field :authors, list_of(:author)
    field :description, :string
    field :isbn, :string
    field :price, :float
    field :title, :string
  end

  object :update_book do
    field :authors, list_of(:author)
    field :description, :string
    field :isbn, :string
    field :price, :float
    field :title, :string
  end

  object :delete_book do
    field :authors, list_of(:author)
    field :description, :string
    field :isbn, :string
    field :price, :float
    field :title, :string
  end

  object :all_reviews do
    field :authors, list_of(:author)
    field :description, :string
    field :isbn, :string
    field :price, :float
    field :title, :string
    field :comment, :string
  end

  object :do_review do
    field :title, :string
    field :comment, :string
    field :authors, list_of(:author)
  end

  object :create_review do
    field :authors, list_of(:author)
    field :description, :string
    field :isbn, :string
    field :price, :float
    field :title, :string
    field :comment, :string
  end

  # Queries
  object :book_queries do
    field :all_books, list_of(:all_books) do
      resolve(&BooksResolver.list_all_books/3)
    end

    field :one_book, non_null(:books) do
      arg(:id, non_null(:id))
      resolve(&BooksResolver.one_book/2)
    end
  end

  object :review_queries do
    field :reviews, list_of(:all_reviews) do
      resolve(&BooksResolver.list_all_reviews/3)
    end
  end

  object :author_queries do
    field :author, list_of(:author) do
      resolve(&BooksResolver.list_all_authors/3)
    end

    field :one_author, non_null(:author) do
      arg(:id, non_null(:id))
      resolve(&BooksResolver.one_author/2)
    end
  end

  # Mutations

  @desc "Mutations for Books and Reviews creation"
  object :books_mutations do
    field :create_book, non_null(:books) do
      arg(:input, non_null(:create_book_input))
      resolve(&BooksResolver.create_book/3)
    end

    field :update_book, non_null(:books) do
      arg(:input, non_null(:create_book_input))
      resolve(&BooksResolver.update_book/3)
    end

    field :delete_book, non_null(:books) do
      arg(:id, non_null(:id))
      resolve(&BooksResolver.delete_book/3)
    end
  end

  @desc "Mutations for  Reviews creation"
  object :review_mutations do
    field :create_review, non_null(:do_review) do
      arg(:input, non_null(:create_review_input))
      resolve(&BooksResolver.create_review/3)
    end

    field :update_review, non_null(:do_review) do
      arg(:input, non_null(:create_review_input))
      resolve(&BooksResolver.update_review/3)
    end

    field :delete_review, non_null(:do_review) do
      arg(:id, non_null(:id))
      resolve(&BooksResolver.delete_review/3)
    end
  end

  @desc "Mutations for  Reviews creation"
  object :author_mutations do
    field :create_author, non_null(:author) do
      arg(:input, non_null(:create_author_input))
      resolve(&BooksResolver.create_author/3)
    end

    field :update_author, non_null(:author) do
      arg(:input, non_null(:create_author_input))
      resolve(&BooksResolver.update_author/2)
    end

    field :delete_author, non_null(:author) do
      arg(:id, non_null(:id))
      resolve(&BooksResolver.delete_author/2)
    end
  end
end
