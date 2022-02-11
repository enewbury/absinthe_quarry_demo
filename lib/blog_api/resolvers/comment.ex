defmodule BlogApi.Resolvers.Comment do
  def user(%{user_id: id}, _, _) do
    {:ok, Blog.Users.get(id)}
  end

  def post(%{post_id: id}, _, _) do
    {:ok, Blog.Posts.get(id)}
  end
end
