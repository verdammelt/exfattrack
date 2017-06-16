defmodule FatTrack.Web.PageController do
  use FatTrack.Web.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
