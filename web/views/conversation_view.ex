defmodule Valchat.ConversationView do
  use Valchat.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, ConversationView, "user.json")}
  end
  def render("user.json", user) do
    %{user: user}
 end

end
