# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elxjob,
  ecto_repos: [Elxjob.Repo]

# Configures the endpoint
config :elxjob, ElxjobWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5rFnCoJ6amsgaekPFnJDBaEmnQSinUAFu3X1Ae4pnMtQBZ8kaxVTdgc43TRLy7IC",
  render_errors: [view: ElxjobWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Elxjob.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures Mailer
config :elxjob, Elxjob.Mailer.Base,
  adapter: Bamboo.SMTPAdapter,
  server: "smtp.yandex.ru",
  port: 587,
  username: System.get_env("FROM_EMAIL"),
  password: System.get_env("FROM_EMAIL_PASS"),
  tls: :if_available, # can be `:always` or `:never`
  ssl: false, # can be `true`
  retries: 1

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
