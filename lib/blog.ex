defmodule Blog do
  @moduledoc """
  Blog keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  def data() do
    Dataloader.Ecto.new(Blog.Repo, query: &query/2)
  end

  def query(Blog.Post, %{filter: filter}) do
    Quarry.build(Blog.Post, filter: filter)
  end

  def query(Blog.Author, %{filter: filter}) do
    Quarry.build(Blog.Author, filter: filter)
  end

  def query(queryable, _), do: queryable
end
