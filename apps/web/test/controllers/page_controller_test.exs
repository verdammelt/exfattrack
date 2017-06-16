defmodule FatTrack.Web.PageControllerTest do
  use FatTrack.Web.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to The Fat Track"
  end
end
