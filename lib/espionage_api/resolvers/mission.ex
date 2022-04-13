defmodule EspionageApi.Resolvers.Mission do
  def missions(%{filter: %{agents: agent} = mission}, _) do
    mission_criteria = mission |> Map.delete(:agent) |> Map.to_list()
    {:ok, Espionage.Missions.all_by_agent(mission_criteria, Map.to_list(agent))}
  end

  def missions(%{filter: mission}, _) do
    {:ok, Espionage.Missions.all(Map.to_list(mission))}
  end

  def missions(_, _) do
    {:ok, Espionage.Missions.all()}
  end
end
