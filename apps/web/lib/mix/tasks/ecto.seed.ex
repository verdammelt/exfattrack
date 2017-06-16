defmodule Mix.Tasks.Ecto.Seed do
  @moduledoc "Mix Task to run all ecto seed files in project"
  use Mix.Task

  @recursive true

  def run(_args) do
    if File.exists?("priv/repo/seeds.exs") do
      Mix.Shell.IO.info("Loading seed data from " <> System.cwd())
      Mix.Tasks.Run.run(["priv/repo/seeds.exs"])
    end
  end
end
