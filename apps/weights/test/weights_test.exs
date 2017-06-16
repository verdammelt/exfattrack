defmodule WeightsTest do
  use ExUnit.Case
  doctest Weights

  alias FatTrack.DB.Repo
  alias Weights.DB.Weight
  alias Weights.DB.User

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(FatTrack.DB.Repo)
    Ecto.Adapters.SQL.Sandbox.mode(FatTrack.DB.Repo, {:shared, self()})
  end

  def ids(objs) do
    Enum.map(objs, &Map.get(&1, :id))
  end

  test "returns weight for user" do
    user = Repo.insert!(%User{})
    expected_weights = [Repo.insert!(%Weight{user: user}),
                        Repo.insert!(%Weight{user: user})]

    actual_weights = Weights.for_user(user.id)

    assert ids(expected_weights) == ids(actual_weights)
  end

  test "only returns weights for a user - not other users" do
    user = Repo.insert!(%User{})
    other_user = Repo.insert!(%User{})
    user_weight = Repo.insert!(%Weight{user: user})
    other_user_weight = Repo.insert!(%Weight{user: other_user})

    assert [user_weight.id] == ids(Weights.for_user(user.id))
    assert [other_user_weight.id] == ids(Weights.for_user(other_user.id))
  end
end
