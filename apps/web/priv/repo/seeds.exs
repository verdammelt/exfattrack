# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Web.Repo.insert!(%Web.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Web.Repo.delete_all Web.User

%Web.User{}
|> Web.User.changeset(%{name: "Test User",
                      email: "testuser@example.com",
                      password: "secret",
                      password_confirmation: "secret"})
|> Web.Repo.insert!
