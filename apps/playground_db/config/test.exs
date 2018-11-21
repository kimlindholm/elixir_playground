# Since configuration is shared in umbrella projects, this file
# should only configure the :playground_db application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# Configure your database
config :playground_db, PlaygroundDb.Repo,
  username: "postgres",
  password: "postgres",
  database: "playground_db_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
