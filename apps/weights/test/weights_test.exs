defmodule FatTrack.WeightsTest do
  use ExUnit.Case
  doctest FatTrack.Weights

  alias FatTrack.DB.Repo
  alias FatTrack.Weights.DB.Weight, as: DBWeight
  alias FatTrack.Weights.Weight
  alias FatTrack.Weights.DB.User

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(FatTrack.DB.Repo)
    Ecto.Adapters.SQL.Sandbox.mode(FatTrack.DB.Repo, {:shared, self()})
  end

  def ids(objs) do
    Enum.map(objs, &Map.get(&1, :id))
  end

  test "returns weight for user" do
    user = Repo.insert!(%User{})
    expected_weights = [Repo.insert!(%DBWeight{user: user}),
                        Repo.insert!(%DBWeight{user: user})]

    actual_weights = FatTrack.Weights.for_user(user.id)

    assert ids(expected_weights) == ids(actual_weights)
  end

  test "only returns weights for a user - not other users" do
    user = Repo.insert!(%User{})
    other_user = Repo.insert!(%User{})
    user_weight = Repo.insert!(%DBWeight{user: user})
    other_user_weight = Repo.insert!(%DBWeight{user: other_user})

    assert [user_weight.id] == ids(FatTrack.Weights.for_user(user.id))
    assert [other_user_weight.id] == ids(FatTrack.Weights.for_user(other_user.id))
  end

  test "returns a Weight.Weight struct not a DB struct" do
    user = Repo.insert!(%User{})
    db_weight = Repo.insert!(%DBWeight{user: user, date: ~D[2000-01-01],
                                       weight: 190.0, trend: 200.0})

    weights = FatTrack.Weights.for_user(user.id)

    assert weights == [%Weight{id: db_weight.id,
                               date: db_weight.date,
                               weight: db_weight.weight,
                               trend: db_weight.trend}]
  end
end
