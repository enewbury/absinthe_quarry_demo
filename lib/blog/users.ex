defmodule Blog.Users do
  alias Blog.Repo
  alias Blog.User

  def get(id) do
    Repo.get(User, id)
  end
end
