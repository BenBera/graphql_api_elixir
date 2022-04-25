defmodule BookStoreApi.Repo do
  use Ecto.Repo,
    otp_app: :book_store_api,
    adapter: Ecto.Adapters.Postgres
end
