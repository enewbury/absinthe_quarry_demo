defmodule BlogApi.Resolvers.Post do
  def post(%{id: id}, _) do
    {:ok, Blog.Posts.get(id)}
  end

  def posts(%{post: %{author: author} = post}, _) do
    {:ok, Blog.Posts.all_by_author(Map.delete(post, :author), author)}
  end

  def posts(%{post: post}, _) do
    criteria = Keyword.new(post)
    {:ok, Blog.Posts.all(criteria)}
  end

  def posts(_, _) do
    {:ok, Blog.Posts.all()}
  end
end
