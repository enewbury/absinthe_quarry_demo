defmodule EspionageApi.Schema do
  @moduledoc """
  The root of the absinthe schema definitions
  """
  use Absinthe.Schema

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]
  import AbsintheQuarry.Helpers, only: [quarry: 2]

  alias Espionage.{Mission, Repo}

  query do
    field :missions, list_of(:mission) do
      arg(:filter, :mission_filter)
      arg(:sort, list_of(:mission_sort))
      arg(:limit, :integer)
      resolve(quarry(Mission, Repo))
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

  input_object :mission_filter do
    field :title, :string
    field :agents, :agent_filter
    field :director, :director_filter
    field :priority__gte, :integer
  end

  input_object :agent_filter do
    field :name, :string
    field :base, :base_filter
  end

  input_object :director_filter do
    field :name, :string
    field :base, :base_filter
  end

  input_object :base_filter do
    field :name, :string
  end

  enum :mission_sort do
    value(:priority)
    value(:director__name)
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
