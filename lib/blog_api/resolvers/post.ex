defmodule BlogApi.Resolvers.Post do
  def post(%{id: id}, _) do
    {:ok, Blog.Posts.get(id)}
  end

  def posts(_, _) do
    {:ok, Blog.Posts.all()}
  end

  def author(%{author_id: id}, _, _) do
    {:ok, Blog.Authors.get(id)}
  end

  def comments(%{id: post_id}, _, _) do
    {:ok, Blog.Comments.all(post_id: post_id)}
  end
end
