defmodule BlogApi.Resolvers.Quarry do
  def quarry(context_fn) do
    fn args, info ->
      fields = Absinthe.Resolution.project(info)
      opts = extract_opts(args, fields)
      {:ok, context_fn.(opts)}
    end
  end

  defp extract_opts(args, fields) when map_size(args) == 0 do
    [load: extract_loads(fields)]
  end

  defp extract_opts(args, fields) do
    args
    |> Map.update(:filter, %{}, &normalize_args/1)
    |> Map.put(:load, extract_loads(fields))
    |> Keyword.new()
  end

  defp extract_loads(fields) do
    fields
    |> Enum.filter(&(Enum.count(&1.selections) > 0))
    |> Enum.map(fn field ->
      %{
        schema_node: %{identifier: field_name},
        argument_data: args,
        selections: sub_fields
      } = field

      {get_canonical_name(field_name), extract_opts(args, sub_fields)}
    end)
  end

  defp normalize_args(args) do
    args
    |> Enum.map(fn
      {field, %{op: op, value: value}} -> {get_canonical_name(field), {op, value}}
      {field, child} when is_map(child) -> {get_canonical_name(field), normalize_args(child)}
      {field, value} -> {get_canonical_name(field), value}
    end)
    |> Map.new()
  end

  defp get_canonical_name(field) do
    field
    |> Atom.to_string()
    |> String.trim_trailing("_where")
    |> String.to_existing_atom()
  rescue
    _ -> field
  end
end
