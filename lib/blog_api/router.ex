defmodule BlogApi.Router do
  use Phoenix.Router

  forward "/graphiql", Absinthe.Plug.GraphiQL, schema: BlogApi.Schema, interface: :simple
  forward "/", Absinthe.Plug, schema: BlogApi.Schema
end
