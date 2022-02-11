defmodule BlogApi.Resolvers.Author do
  def author(%{id: id}, _) do
    {:ok, Blog.Authors.get(id)}
  end

  def authors(%{filter: author_filter}, _) do
    {:ok, Blog.Authors.all(author_filter)}
  end

  def authors(_, _) do
    {:ok, Blog.Authors.all()}
  end
end
