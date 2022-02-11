defmodule BlogApi.Resolvers.Author do
  def author(%{id: id}, _) do
    {:ok, Blog.Authors.get(id)}
  end

  def authors(_, _) do
    {:ok, Blog.Authors.all()}
  end

  def user(%{user_id: id}, _, _) do
    {:ok, Blog.Users.get(id)}
  end

  def posts(%{id: author_id}, _, _) do
    {:ok, Blog.Posts.all(author_id: author_id)}
  end
end
