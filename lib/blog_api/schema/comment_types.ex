defmodule BlogApi.Schema.CommentTypes do
  use Absinthe.Schema.Notation

  object :comment_queries do
  end

  object :comment do
    field :id, :id
    field :body, :string
    field :user, non_null(:user)
    field :post, non_null(:post)
  end

  input_object :comment_filter do
    field :body, :string
    field :user_id, :id
    field :user, :user_filter
  end
end
