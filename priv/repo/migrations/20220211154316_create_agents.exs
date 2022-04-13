defmodule Espionage.Repo.Migrations.CreateAgents do
  use Ecto.Migration

  def change do
    create table(:agents, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add(:name, :string)
      add(:mission_id, references(:missions, on_delete: :nothing, type: :binary_id))
      add(:base_id, references(:bases, on_delete: :nothing, type: :binary_id))

      timestamps()
    end

    create(index(:agents, [:mission_id]))
    create(index(:agents, [:base_id]))
  end
end
