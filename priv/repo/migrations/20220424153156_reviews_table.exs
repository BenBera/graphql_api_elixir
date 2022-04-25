defmodule BookStoreApi.Repo.Migrations.ReviewsTable do
  use Ecto.Migration

  def change do
    create table(:reviews) do
      add(:comment, :string)
      add(:author_id, :integer)
      add(:books_id,  references(:books, on_delete: :nothing))

      timestamps()
    end

    create(index(:reviews, [:books_id]))
    create(index(:reviews, [:author_id]))
  end
end
