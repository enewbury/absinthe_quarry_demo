defmodule EspionageApi.Resolvers.Mission do
  def missions(_, _) do
    {:ok, Espionage.Missions.all()}
  end
end
