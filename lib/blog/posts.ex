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
end
