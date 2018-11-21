defmodule PlaygroundDb.Repo do
  use Ecto.Repo,
    otp_app: :playground_db,
    adapter: Ecto.Adapters.Postgres
end
