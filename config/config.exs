# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :valchat,
  ecto_repos: [Valchat.Repo]

# Configures the endpoint
config :valchat, Valchat.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DEOjBouqJLCg96pqZsjKE2+hzqgjb1AJt4z1CVEYsSOSGe41GnYcM8b+IiU1y9d+",
  render_errors: [view: Valchat.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Valchat.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
