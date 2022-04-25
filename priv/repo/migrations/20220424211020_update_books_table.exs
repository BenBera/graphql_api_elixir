defmodule BookStoreApi.Repo.Migrations.UpdateBooksTable do
  use Ecto.Migration

  def change do
    alter table(:books) do
      add(:author_id, references(:authors, on_delete: :nothing))
    end

    create(index(:books, [:author_id]))
  end
end
