defmodule BlogApi.Schema.AuthorTypes do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias BlogApi.Resolvers

  object :author_queries do
    field :author, :author do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Author.author/2)
    end

    field :authors, list_of(:author) do
      arg(:filter, :author_filter)
      resolve(&Resolvers.Author.authors/2)
    end
  end

  object :author do
    field :id, :id
    field :publisher, :string
    field :user, non_null(:user), resolve: dataloader(Blog)
    field :posts, list_of(:post), resolve: dataloader(Blog)
  end

  input_object :author_filter do
    field :publisher, :string
  end
end
