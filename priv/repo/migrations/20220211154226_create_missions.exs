defmodule Espionage.Repo.Migrations.CreateMissions do
  use Ecto.Migration

  def change do
    create table(:missions, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add(:title, :string)
      add(:description, :string)
      add(:priority, :integer, default: 0)
      add(:director_id, references(:directors, on_delete: :nothing, type: :binary_id))

      timestamps()
    end

    create(index(:missions, [:director_id]))
  end
end
