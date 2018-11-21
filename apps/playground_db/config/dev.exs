# Since configuration is shared in umbrella projects, this file
# should only configure the :playground_db application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Configure your database
config :playground_db, PlaygroundDb.Repo,
  username: "postgres",
  password: "postgres",
  database: "playground_dev",
  hostname: "localhost",
  pool_size: 10
