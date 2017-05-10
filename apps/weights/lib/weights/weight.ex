defmodule Weights.Weight do
  use Ecto.Schema

  schema "weights" do
    belongs_to :user, Weights.User
    field :date, :date
    field :weight, :float
    field :trend, :float

    timestamps()
  end

  def changeset(model, _params \\ %{}) do
    model
  end
end
