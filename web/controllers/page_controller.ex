defmodule Valchat.PageController do

  use Valchat.Web, :controller

  # plug here mean that this plug will be execute before each handler
  plug(Valchat.Plugs.RequireAuth when action in [:index])

  def index(conn, _params) do
    render conn, "index.html"
  end
end
