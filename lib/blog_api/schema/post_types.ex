defmodule BlogApi.Schema.PostTypes do
  use Absinthe.Schema.Notation

  alias BlogApi.Resolvers

  object :post_queries do
    field :post, :post do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Post.post/2)
    end

    field :posts, list_of(:post) do
      resolve(&Resolvers.Post.posts/2)
    end
  end

  object :post do
    field :id, :id
    field :title, :string
    field :body, :string
    field :views, non_null(:integer)
    field :author, non_null(:author), resolve: &Resolvers.Post.author/3
    field :comments, list_of(:comment), resolve: &Resolvers.Post.comments/3
  end
end
