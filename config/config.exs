# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :people,
  ecto_repos: [People.Repo]

# Configures the endpoint
config :people, PeopleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "kU10GMySnHCU5Ub5dgU33lenJZ2xY/Gx0p2QyDuHuTF7FVM+D+9o7fJB7EPse7FW",
  render_errors: [view: PeopleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: People.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
