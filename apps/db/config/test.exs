use Mix.Config

# Configure your database
config :db, FatTrack.DB.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "exfattrack_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
