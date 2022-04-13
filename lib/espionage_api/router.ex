defmodule EspionageApi.Router do
  use Phoenix.Router

  forward "/graphiql", Absinthe.Plug.GraphiQL, schema: EspionageApi.Schema, interface: :simple
  forward "/", Absinthe.Plug, schema: EspionageApi.Schema
end
