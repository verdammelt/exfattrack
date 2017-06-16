defmodule FatTrack.Mixfile do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      aliases: aliases(),
      deps: deps(),
      dialyzer: [plt_add_deps: :transitive],
      elixirc_options: [warnings_as_errors: true]
    ]
  end

  defp aliases do
    [
      "dialyzer": "dialyzer --halt-exit-status",

      "ecto.setup": ["ecto.create", "ecto.migrate", "ecto.seed"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
    ]
  end

  defp deps do
    [
      {:credo, "~> 0.5", only: [:dev, :test], override: true},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false}
    ]
  end
end
