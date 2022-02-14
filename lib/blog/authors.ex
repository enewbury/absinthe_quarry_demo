defmodule Blog.Authors do
  alias Blog.Repo
  alias Blog.Author

  def get(id) do
    Repo.get(Author, id)
  end

  def all(opts \\ []) do
    Author
    |> Quarry.build(opts)
    |> Repo.all()
  end
end
