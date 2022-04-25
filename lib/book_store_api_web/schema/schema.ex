defmodule BookStoreApiWeb.Schema do
  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)
  import_types(__MODULE__.InputTypes)
  import_types(__MODULE__.Types)

  # import queries
  query do
    import_fields(:book_queries)
    import_fields(:review_queries)
    import_fields(:author_queries)
  end

  # import mutations
  mutation do
    # books mutation
    import_fields(:books_mutations)

    # review mutation
    import_fields(:review_mutations)

    # Author Mutation
    import_fields(:author_mutations)
  end
end
