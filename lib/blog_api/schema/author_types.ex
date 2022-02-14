defmodule BlogApi.Schema.AuthorTypes do
  use Absinthe.Schema.Notation

  import BlogApi.Resolvers.Quarry

  alias BlogApi.Resolvers
  alias Blog.Authors

  object :author_queries do
    field :author, :author do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Author.author/2)
    end

    field :authors, list_of(:author) do
      arg(:filter, :author_filter)
      resolve(quarry(&Authors.all/1))
    end
  end

  object :author do
    field :id, :id
    field :publisher, :string
    field :user, non_null(:user)
    field :posts, list_of(:post)
  end

  input_object :author_filter do
    field :publisher, :string
    field :publisher_where, :string_filter
    field :user, :user_filter
    field :posts, :post_filter
  end
end
