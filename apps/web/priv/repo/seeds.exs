# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FatTrack.DB.Repo.insert!(%Web.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
FatTrack.DB.Repo.delete_all FatTrack.Web.User

%FatTrack.Web.User{}
|> FatTrack.Web.User.changeset(%{name: "Test User",
                                email: "testuser@example.com",
                                password: "secret",
                                password_confirmation: "secret"})
|> FatTrack.DB.Repo.insert!
