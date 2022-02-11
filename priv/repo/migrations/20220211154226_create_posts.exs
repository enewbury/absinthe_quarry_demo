defmodule Blog.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add(:title, :string)
      add(:body, :string)
      add(:views, :integer, default: 0)
      add(:author_id, references(:authors, on_delete: :nothing, type: :binary_id))

      timestamps()
    end

    create(index(:posts, [:author_id]))
  end
end
