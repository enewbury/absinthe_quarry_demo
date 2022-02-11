defmodule BlogApi.Schema.CommentTypes do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  object :comment_queries do
  end

  object :comment do
    field :id, :id
    field :body, :string
    field :user, non_null(:user), resolve: dataloader(Blog)
    field :post, :post, resolve: dataloader(Blog)
  end
end
