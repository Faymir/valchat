defmodule Valchat.AuthController do
  use Valchat.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"

  end

  def signin(_conn, _params) do
  end


  def signup(_conn, _params) do
  end

  def signout(_conn, _params) do
  end


end
