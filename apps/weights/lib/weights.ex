defmodule FatTrack.Weights do
  @moduledoc """
  Documentation for Weights.
  """

  alias FatTrack.DB.Repo
  alias FatTrack.Weights.{DB, Weight}

  def for_user(user_id) do
    DB.User |>
      Repo.get(user_id) |>
      Repo.preload([:weights]) |>
      Map.get(:weights) |>
      Enum.map(&Weight.from_db/1)
  end
end
