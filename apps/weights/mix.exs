defmodule Weights.Mixfile do
  use Mix.Project

  def project do
    [app: :weights,
     version: "0.1.0",
     build_path: "../../_build",
     config_path: "../../config/config.exs",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     elixir: "~> 1.4",
     elixirc_options: [warnings_as_errors: true],
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger, :postgrex, :db],
     mod: {Weights.Application, []}]
  end

  defp deps do
    [
      {:db, in_umbrella: true},

      {:credo, path: "../../deps/credo", only: [:dev, :test]}
    ]
  end

  defp aliases do
    [
      "ecto.setup": ["ecto.create --quiet", "ecto.migrate"],
      "test": ["ecto.setup", "test"]
    ]
  end
end
