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
    ]
  end

  defp aliases do
    [
      "dialyzer": "dialyzer --halt-exit-status"
    ]
  end

  defp deps do
    [
      {:credo, "~> 0.5", only: [:dev, :test], override: true},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false}
    ]
  end
end
