defmodule Espionage.Agent do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "agents" do
    field :name, :string

    belongs_to :mission, Espionage.Mission
    belongs_to :base, Espionage.Base

    timestamps()
  end

  @doc false

  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
