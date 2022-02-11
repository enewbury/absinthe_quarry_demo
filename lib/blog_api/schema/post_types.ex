defmodule BlogApi.Schema.PostTypes do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias BlogApi.Resolvers

  object :post_queries do
    field :post, :post do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Post.post/2)
    end

    field :posts, list_of(:post) do
      arg(:filter, :post_filter)
      resolve(&Resolvers.Post.posts/2)
    end
  end

  object :post do
    field :id, :id
    field :title, :string
    field :body, :string
    field :views, non_null(:integer)

    field :author, non_null(:author) do
      arg(:filter, :author_filter)
      resolve(dataloader(Blog))
    end

    field :comments, list_of(:comment), resolve: dataloader(Blog)
  end

  input_object :post_filter do
    field :title, :string
    field :body, :string
    field :views, :int_filter
    field :author, :author_filter
  end
end
