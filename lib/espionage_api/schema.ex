defmodule EspionageApi.Schema do
  @moduledoc """
  The root of the absinthe schema definitions
  """

  alias EspionageApi.Resolvers

  use Absinthe.Schema

  query do
    field :missions, list_of(:mission) do
      resolve(&Resolvers.Mission.missions/2)
    end
  end

  object :mission do
    field :id, :id
    field :title, :string
    field :description, :string
    field :priority, non_null(:integer)
    field :director, non_null(:director), resolve: &Resolvers.Mission.director/3
    field :agents, list_of(:agent), resolve: &Resolvers.Mission.agents/3
  end

  object :director do
    field :id, :id
    field :name, :string
    field :base, non_null(:base), resolve: &Resolvers.Director.base/3
    field(:missions, list_of(:mission), resolve: &Resolvers.Director.missions/3)
  end

  object :agent do
    field :id, :id
    field :name, :string
    field :base, non_null(:base), resolve: &Resolvers.Agent.base/3
    field :mission, :mission, resolve: &Resolvers.Agent.mission/3
  end

  object :base do
    field :id, :id
    field :name, :string
  end
end
