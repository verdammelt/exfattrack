defmodule FatTrack.DB.Repo.Migrations.AddWeightsTable do
  use Ecto.Migration

  def change do
    create table(:weights) do
      add :user_id, references(:users)

      add :date, :date
      add :weight, :float
      add :trend, :float

      timestamps()
    end
  end
end
