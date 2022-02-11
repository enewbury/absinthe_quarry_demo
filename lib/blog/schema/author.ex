defmodule Blog.Author do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "authors" do
    field :publisher, :string

    belongs_to :user, Blog.User
    has_many :posts, Blog.Post

    timestamps()
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:publisher])
    |> validate_required([:publisher])
  end
end
