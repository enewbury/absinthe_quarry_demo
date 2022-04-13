defmodule EspionageApi.Schema do
  @moduledoc """
  The root of the absinthe schema definitions
  """
  use Absinthe.Schema

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
    field :director, non_null(:director), meta: [quarry: true]

    field :agents, list_of(:agent), meta: [quarry: true] do
      arg(:filter, :agent_filter)
    end
  end

  object :director do
    field :id, :id
    field :name, :string
    field :base, non_null(:base), meta: [quarry: true]
    field :missions, list_of(:mission), meta: [quarry: true]
  end

  object :agent do
    field :id, :id
    field :name, :string
    field :base, non_null(:base), meta: [quarry: true]
    field :mission, :mission, meta: [quarry: true]
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
end
