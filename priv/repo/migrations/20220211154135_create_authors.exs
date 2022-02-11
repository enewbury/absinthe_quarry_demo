defmodule Blog.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add(:publisher, :string)
      add(:user_id, references(:users, on_delete: :nothing, type: :binary_id))

      timestamps()
    end

    create(index(:authors, [:user_id]))
  end
end
