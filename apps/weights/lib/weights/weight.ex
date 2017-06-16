defmodule Weights.Weight do
  @moduledoc """
    iex> Weights.Weight.from_db(%Weights.DB.Weight{id: 13, user_id: 20, date: ~D[1998-05-24], weight: 189.9, trend: 201.23})
    %Weights.Weight{id: 13, date: ~D[1998-05-24], weight: 189.9, trend: 201.23}
  """

  defstruct id: nil, date: nil, weight: nil, trend: nil

  def from_db(db_weight) do
    %__MODULE__{id: db_weight.id,
                date: db_weight.date,
                weight: db_weight.weight,
                trend: db_weight.trend}
  end
end
