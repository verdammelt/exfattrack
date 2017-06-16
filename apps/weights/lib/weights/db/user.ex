defmodule Weights.DB.User do
  use Ecto.Schema

  schema "users" do
    has_many :weights, Weights.DB.Weight

    timestamps()
  end
end
