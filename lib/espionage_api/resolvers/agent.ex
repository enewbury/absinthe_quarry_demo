defmodule EspionageApi.Resolvers.Agent do
  def base(%{base_id: id}, _, _) do
    {:ok, Espionage.Bases.get(id)}
  end

  def mission(%{mission_id: id}, _, _) do
    {:ok, Espionage.Missions.get(id)}
  end
end
