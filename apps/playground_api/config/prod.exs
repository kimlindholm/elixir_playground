# Since configuration is shared in umbrella projects, this file
# should only configure the :playground_api application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

config :playground_api, port: 80

config :playground_api,
  basic_auth_username: "${BASIC_AUTH_USERNAME}",
  basic_auth_password: "${BASIC_AUTH_PASSWORD}",
  basic_auth_realm: "${BASIC_AUTH_REALM}"
