defmodule Espionage.Mission do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "missions" do
    field :description, :string
    field :title, :string
    field :priority, :integer

    belongs_to :director, Espionage.Director
    has_many :agents, Espionage.Agent

    timestamps()
  end

  @doc false
  def changeset(mission, attrs) do
    mission
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
