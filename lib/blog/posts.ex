defmodule Blog.Posts do
  alias Blog.Repo
  alias Blog.Post

  import Ecto.Query

  def get(id) do
    Repo.get(Post, id)
  end

  def all(criteria \\ []) do
    Repo.all(from(p in Post, where: ^criteria))
  end

  def all_by_author(post_criteria, author_criteria) do
    query = from(p in Post, join: a in assoc(p, :author))

    query =
      Enum.reduce(post_criteria, query, fn {key, value}, q ->
        where(q, [p, _], field(p, ^key) == ^value)
      end)

    query =
      Enum.reduce(author_criteria, query, fn {key, value}, q ->
        where(q, [_, a], field(a, ^key) == ^value)
      end)

    Repo.all(query)
  end
end
