defmodule Blog.Comments do
  alias Blog.Repo
  alias Blog.Comment

  import Ecto.Query

  def get(id) do
    Repo.get(Comment, id)
  end

  def all(criteria \\ []) do
    Repo.all(from(c in Comment, where: ^criteria))
  end
end
