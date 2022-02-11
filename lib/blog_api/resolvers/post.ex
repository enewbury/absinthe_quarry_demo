defmodule BlogApi.Resolvers.Post do
  def post(%{id: id}, _) do
    {:ok, Blog.Posts.get(id)}
  end

  def posts(_, _) do
    {:ok, Blog.Posts.all()}
  end
end
