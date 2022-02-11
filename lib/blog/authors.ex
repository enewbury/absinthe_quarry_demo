defmodule Blog.Authors do
  alias Blog.Repo
  alias Blog.Author

  import Ecto.Query

  def get(id) do
    Repo.get(Author, id)
  end

  def all(criteria \\ []) do
    Repo.all(from(p in Author, where: ^criteria))
  end
end
