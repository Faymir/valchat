defmodule Valchat.ConversationController do
  use Valchat.Web, :controller

  #plug(Valchat.Plugs.RequireAuth when action in [:index])
  def index(conn, _params) do
    IO.puts("+++++++")
    IO.inspect(conn)
    users = Valchat.Repo.all(
      from u in Valchat.User,
      where: u.id != 1,
      select: [u.id, u.username]
    )
    render(conn, "index.json",users)
  end

end
