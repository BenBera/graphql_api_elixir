defmodule BookStoreApi.Repo.Migrations.CreateAuthor do
  use Ecto.Migration

  def change do
    create table("authors") do
      add :name, :string
      add :age, :integer
      add :city, :string

      timestamps()
    end
  end
end
