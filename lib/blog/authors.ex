defmodule Blog.Authors do
  alias Blog.Repo
  alias Blog.Author

  def get(id) do
    Repo.get(Author, id)
  end

  def all(criteria \\ %{}) do
    Author
    |> Quarry.build(filter: criteria)
    |> Repo.all()
  end
end
