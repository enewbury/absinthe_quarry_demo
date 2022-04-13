defmodule Espionage do
  @moduledoc """
  Espionage keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def data() do
    Dataloader.Ecto.new(Espionage.Repo)
  end
end
