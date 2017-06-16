defmodule FatTrack.Weights.DB.User do
  use Ecto.Schema

  schema "users" do
    has_many :weights, FatTrack.Weights.DB.Weight

    timestamps()
  end
end
