# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :landbnb,
  ecto_repos: [Landbnb.Repo]

# Configures the endpoint
config :landbnb, Landbnb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qbJSMJzlR2EO028/sOMK2d7kY0IotRfTed4EqYlXhJThaDu7gyBbWofO8O89VBXv",
  render_errors: [view: Landbnb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Landbnb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure your database
config :landbnb, Landbnb.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL") || "${DATABASE_URL}",
  pool_size: 10
