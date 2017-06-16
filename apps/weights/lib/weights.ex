defmodule Weights do
  @moduledoc """
  Documentation for Weights.
  """

  alias FatTrack.DB.Repo

  def for_user(user_id) do
    Weights.DB.User |>
      Repo.get(user_id) |>
      Repo.preload([:weights]) |>
      Map.get(:weights) |>
      Enum.map(&Weights.Weight.from_db/1)
  end
end
