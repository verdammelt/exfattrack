use Mix.Config

# Configure your database
config :db, FatTrack.DB.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "exfattrack_dev",
  hostname: "localhost",
  pool_size: 10
