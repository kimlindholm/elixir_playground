# Since configuration is shared in umbrella projects, this file
# should only configure the :playground_db application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# Do not print debug messages in production
config :logger, level: :info

# import_config "prod.secret.exs"

config :playground_db, PlaygroundDb.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: "${DATABASE_URL}",
  database: "",
  ssl: true,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "2")
