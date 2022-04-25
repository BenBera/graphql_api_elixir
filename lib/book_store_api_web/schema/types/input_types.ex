defmodule BookStoreApiWeb.Schema.InputTypes do
  use Absinthe.Schema.Notation

  # Books input Objects
  @desc "an input object for fetching Books By Id ."
  input_object :input do
    field :id, non_null(:integer)
  end
  # @desc "an input object for fetching  By Id ."
  # input_object :one_author do
  #   field :id, non_null(:integer)
  # end

  @desc "an input object for creating Book."
  input_object :create_book_input do
    field :author_id, :integer
    field :description, :string
    field :isbn, :string
    field :price, :float
    field :title, :string
  end

   # Review input Objects
   @desc "an input object for fetching reviews By Id ."
   input_object :review_id_input do
     field :id, non_null(:id)
   end

  @desc "an input object for creating a review."
  input_object :create_review_input do
    field(:books_id, :integer)
    field(:comment, :string)
  end

  #author input objects
   @desc "an input object for fetching authors By Id ."
   input_object :author_id_input do
     field :id, non_null(:id)
   end

   @desc "an input object for creating an Author."
  input_object :create_author_input do
    field(:name, :string)
    field(:city, :string)
    field(:age, :integer)
  end


end
