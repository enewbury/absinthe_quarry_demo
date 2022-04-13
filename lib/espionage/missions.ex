defmodule Espionage.Missions do
  alias Espionage.Repo
  alias Espionage.Mission

  import Ecto.Query

  def all(criteria \\ []) do
    Repo.all(from(p in Mission, where: ^criteria))
  end

  def all_by_agent(mission_criteria, agent_criteria) do
    query = from m in Mission, join: a in assoc(m, :agents)

    query =
      Enum.reduce(mission_criteria, query, fn {key, value}, q ->
        where(q, [m, _], field(m, ^key) == ^value)
      end)

    query =
      Enum.reduce(agent_criteria, query, fn {key, value}, q ->
        where(q, [_, a], field(a, ^key) == ^value)
      end)

    Repo.all(query)
  end
end
