# Since configuration is shared in umbrella projects, this file
# should only configure the :playground_db application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :playground_db, PlaygroundDb.Repo,
  username: "postgres",
  password: "postgres",
  database: "playground_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
