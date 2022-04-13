defmodule Espionage.Director do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "directors" do
    field :name, :string

    belongs_to :base, Espionage.Base
    has_many :missions, Espionage.Mission

    timestamps()
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
