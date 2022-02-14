defmodule Blog.Posts do
  alias Blog.Repo
  alias Blog.Post

  def get(id) do
    Repo.get(Post, id)
  end

  def all(opts \\ []) do
    Post
    |> Quarry.build(opts)
    |> Repo.all()
  end
end
