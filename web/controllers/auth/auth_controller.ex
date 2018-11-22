defmodule Valchat.AuthController do
  use Valchat.Web, :controller

  # plug here mean that this plug will be execute before each handler
  plug(Valchat.Plugs.RequireAuth when action in [:signout])

  def index(conn, _params) do
    render conn, Valchat.AuthView, "index.html"
  end

  def signin(_conn, _params) do
  end


  def signup(_conn, _params) do
  end

  def signout(_conn, _params) do
  end


end
