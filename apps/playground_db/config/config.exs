# Since configuration is shared in umbrella projects, this file
# should only configure the :playground_db application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

config :playground_db,
  ecto_repos: [PlaygroundDb.Repo]

import_config "#{Mix.env()}.exs"
