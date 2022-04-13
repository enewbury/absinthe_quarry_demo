defmodule Espionage.Bases do
  alias Espionage.Repo
  alias Espionage.Base

  def get(id) do
    Repo.get(Base, id)
  end
end
