defmodule BlogApi.Schema.CommentTypes do
  use Absinthe.Schema.Notation

  alias BlogApi.Resolvers

  object :comment_queries do
  end

  object :comment do
    field :id, :id
    field :body, :string
    field :user, non_null(:user), resolve: &Resolvers.Comment.user/3
    field :post, :post, resolve: &Resolvers.Comment.post/3
  end
end
