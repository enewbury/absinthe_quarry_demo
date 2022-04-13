defmodule Espionage.Missions do
  alias Espionage.Repo
  alias Espionage.Mission

  import Ecto.Query

  def get(id) do
    Repo.get(Mission, id)
  end

  def all(criteria \\ []) do
    Repo.all(from(p in Mission, where: ^criteria))
  end
end
