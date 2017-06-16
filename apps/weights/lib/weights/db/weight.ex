defmodule Weights.DB.Weight do
  use Ecto.Schema

  schema "weights" do
    belongs_to :user, Weights.DB.User
    field :date, :date
    field :weight, :float
    field :trend, :float

    timestamps()
  end
end
