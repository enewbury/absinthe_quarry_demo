defmodule EspionageApi.Schema do
  @moduledoc """
  The root of the absinthe schema definitions
  """
  use Absinthe.Schema

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias EspionageApi.Resolvers

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
    field :director, non_null(:director), resolve: dataloader(Espionage)
    field :agents, list_of(:agent), resolve: dataloader(Espionage)
  end

  object :director do
    field :id, :id
    field :name, :string
    field :base, non_null(:base), resolve: dataloader(Espionage)
    field :missions, list_of(:mission), resolve: dataloader(Espionage)
  end

  object :agent do
    field :id, :id
    field :name, :string
    field :base, non_null(:base), resolve: dataloader(Espionage)
    field :mission, :mission, resolve: dataloader(Espionage)
  end

  object :base do
    field :id, :id
    field :name, :string
  end

  @impl true
  def context(ctx) do
    loader = Dataloader.new() |> Dataloader.add_source(Espionage, Espionage.data())
    Map.put(ctx, :loader, loader)
  end

  @impl true
  def plugins do
    [Absinthe.Middleware.Dataloader | Absinthe.Plugin.defaults()]
  end
end
