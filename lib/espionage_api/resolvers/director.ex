defmodule EspionageApi.Resolvers.Director do
  def directors(_, _) do
    {:ok, Espionage.Directors.all()}
  end

  def base(%{base_id: id}, _, _) do
    {:ok, Espionage.Bases.get(id)}
  end

  def missions(%{id: director_id}, _, _) do
    {:ok, Espionage.Missions.all(director_id: director_id)}
  end
end
