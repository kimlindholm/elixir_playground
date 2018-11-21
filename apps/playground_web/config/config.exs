# Since configuration is shared in umbrella projects, this file
# should only configure the :playground_web application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# General application configuration
config :playground_web,
  ecto_repos: [PlaygroundDb.Repo],
  generators: [context_app: :playground_db]

# Configures the endpoint
config :playground_web, PlaygroundWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ens2K8bIB3xfkyoCZ+rHScvfDSEDyvoMDZlmWikYkdK7N+620ukgJEVH2CSmXlSZ",
  render_errors: [view: PlaygroundWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PlaygroundWeb.PubSub, adapter: Phoenix.PubSub.PG2]

config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
