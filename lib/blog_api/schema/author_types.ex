defmodule BlogApi.Schema.AuthorTypes do
  use Absinthe.Schema.Notation

  alias BlogApi.Resolvers

  object :author_queries do
    field :author, :author do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Author.author/2)
    end

    field :authors, list_of(:author) do
      resolve(&Resolvers.Author.authors/2)
    end
  end

  object :author do
    field :id, :id
    field :publisher, :string
    field :user, non_null(:user), resolve: &Resolvers.Author.user/3
    field :posts, list_of(:post), resolve: &Resolvers.Author.posts/3
  end
end
