defmodule Espionage.Directors do
  alias Espionage.Repo
  alias Espionage.Director

  import Ecto.Query

  def get(id) do
    Repo.get(Director, id)
  end

  def all(criteria \\ []) do
    Repo.all(from(p in Director, where: ^criteria))
  end
end
