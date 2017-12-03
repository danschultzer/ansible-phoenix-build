# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ansible_phoenix_build,
  ecto_repos: [AnsiblePhoenixBuild.Repo]

# Configures the endpoint
config :ansible_phoenix_build, AnsiblePhoenixBuildWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "N6Rut6zZ7PH/PPp9vy8J+OWyUVPY9KoFF1IEOjDjZ3nJbuET6Xc5Xt2Eniy1bBRf",
  render_errors: [view: AnsiblePhoenixBuildWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AnsiblePhoenixBuild.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
