defmodule EspionageApi.Resolvers.Mission do
  def missions(_, _) do
    {:ok, Espionage.Missions.all()}
  end

  def director(%{director_id: id}, _, _) do
    {:ok, Espionage.Directors.get(id)}
  end

  def agents(%{id: mission_id}, _, _) do
    {:ok, Espionage.Agents.all(mission_id: mission_id)}
  end
end
