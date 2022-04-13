defmodule Espionage.Agents do
  alias Espionage.Repo
  alias Espionage.Agent

  import Ecto.Query

  def get(id) do
    Repo.get(Agent, id)
  end

  def all(criteria \\ []) do
    Repo.all(from(c in Agent, where: ^criteria))
  end
end
