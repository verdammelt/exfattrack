defmodule Weights.User do
  use Ecto.Schema

  schema "users" do
    has_many :weights, Weights.Weight

    timestamps()
  end
end
