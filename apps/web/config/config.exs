# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :web,
  ecto_repos: [Web.Repo]

# Configures the endpoint
config :web, Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KwpOzFzhnciU5BHmo2/04HdnNUzm1qR3GxbQgIN84mPtxuL+YU+tnOoOQUvCxDoX",
  render_errors: [view: Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Web.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Web.User,
  repo: Web.Repo,
  module: Web,
  logged_out_url: "/",
  email_from_name: "Mark Simpson",
  email_from_email: "verdammelt+fattrack@gmail.com",
  opts: [:trackable, :invitable, :rememberable, :authenticatable, :recoverable,
         :lockable, :unlockable_with_token, :registerable, :confirmable]

config :coherence, Web.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: System.get_env("SENDGRID_API_KEY")
# %% End Coherence Configuration %%

config :coherence,
  site_name: "The Fat Track",
  layout: {Web.LayoutView, :app}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
