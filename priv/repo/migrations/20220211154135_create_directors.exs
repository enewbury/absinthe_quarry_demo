defmodule Espionage.Repo.Migrations.CreateDirectors do
  use Ecto.Migration

  def change do
    create table(:directors, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add(:name, :string)
      add(:base_id, references(:bases, on_delete: :nothing, type: :binary_id))

      timestamps()
    end

    create(index(:directors, [:base_id]))
  end
end
