defmodule Valchat.PageController do
  use Valchat.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
