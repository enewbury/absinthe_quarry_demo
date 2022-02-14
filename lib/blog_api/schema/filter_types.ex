defmodule BlogApi.Schema.FilterTypes do
  use Absinthe.Schema.Notation

  input_object :string_filter do
    field :op, :operator
    field :value, :string
  end

  input_object :integer_filter do
    field :op, :operator
    field :value, :integer
  end
end
