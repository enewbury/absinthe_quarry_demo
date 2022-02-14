defmodule BlogApi.Schema.PostTypes do
  use Absinthe.Schema.Notation

  import BlogApi.Resolvers.Quarry

  alias BlogApi.Resolvers
  alias Blog.Posts

  object :post_queries do
    field :post, :post do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Post.post/2)
    end

    field :posts, list_of(:post) do
      arg(:filter, :post_filter)
      resolve(quarry(&Posts.all/1))
    end
  end

  object :post do
    field :id, :id
    field :title, :string
    field :body, :string
    field :views, non_null(:integer)
    field :author, non_null(:author)

    field :comments, list_of(:comment) do
      arg(:filter, :comment_filter)
    end
  end

  input_object :post_filter do
    field :title, :string
    field :body, :string
    field :views_where, :integer_filter
    field :views, :integer
    field :author, :author_filter
  end
end
