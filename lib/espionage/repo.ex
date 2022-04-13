defmodule Espionage.Repo do
  use Ecto.Repo,
    otp_app: :espionage,
    adapter: Ecto.Adapters.Postgres
end
