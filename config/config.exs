# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :gor_project,
  namespace: GORproject,
  ecto_repos: [GORproject.Repo]

# Configures the endpoint
config :gor_project, GORprojectWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hfs+J+s8J8jU6bPWfAllOQPNDsFoaREBdNW1/xU26oHUnJoLYZC7JNoVeiTSDE7i",
  render_errors: [view: GORprojectWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: GORproject.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
