defmodule Blog.Posts do
  alias Blog.Repo
  alias Blog.Post

  def get(id) do
    Repo.get(Post, id)
  end

  def all(criteria \\ %{}) do
    Post
    |> Quarry.build(filter: criteria)
    |> Repo.all()
  end
end
