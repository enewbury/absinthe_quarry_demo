defmodule BlogApi.Schema do
  @moduledoc """
  The root of the absinthe schema definitions
  """

  use Absinthe.Schema

  import_types(BlogApi.Schema.FilterTypes)
  import_types(BlogApi.Schema.UserTypes)
  import_types(BlogApi.Schema.AuthorTypes)
  import_types(BlogApi.Schema.PostTypes)
  import_types(BlogApi.Schema.CommentTypes)

  enum :operator do
    value(:eq)
    value(:lt)
    value(:lte)
    value(:gt)
    value(:gte)
    value(:starts_with)
    value(:ends_with)
  end

  query do
    import_fields(:user_queries)
    import_fields(:author_queries)
    import_fields(:post_queries)
    import_fields(:comment_queries)
  end

  @impl true
  def context(ctx) do
    loader = Dataloader.new() |> Dataloader.add_source(Blog, Blog.data())
    Map.put(ctx, :loader, loader)
  end

  @impl true
  def plugins do
    [Absinthe.Middleware.Dataloader | Absinthe.Plugin.defaults()]
  end
end
