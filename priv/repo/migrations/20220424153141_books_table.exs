defmodule BookStoreApi.Repo.Migrations.BooksTable do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :price, :float
      add :isbn, :text
      add :description, :text


      timestamps()
    end

    create unique_index(:books, [:isbn])


  end
end
