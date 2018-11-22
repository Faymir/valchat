defmodule Valchat.AuthController do
  use Valchat.Web, :controller

  # plug here mean that this plug will be execute before each handler
  plug(Valchat.Plugs.RequireAuth when action in [:signout])

  def index(conn, _params) do

    if(conn.assigns[:user]) do
      conn
      |> redirect(to: page_path(conn, :index))
    else
      changeset = Valchat.User.changeset(%Valchat.User{}, %{})
      render conn, Valchat.AuthView, "index.html", changeset: changeset
    end
  end

  def signin(conn, %{"user" => %{"email"=> user_mail , "password" => user_pass }}) do
    user_params = %{
      email: user_mail,
      password: user_pass
    }

    changeset = Valchat.User.changeset(%Valchat.User{}, user_params)

    user = Valchat.Repo.get_by(Valchat.User, [email: user_mail])
    # changeset = Valchat.Repo.get_by(Valchat.User, [email: user_mail])

    # IO.puts("*******---****")
    # IO.inspect(user)
    # IO.inspect(changeset)

    if user do
      if Comeonin.Argon2.checkpw( user_pass, user.password ) do
        conn
        |> assign(:user, user)
        |> put_session(:user_id, user.id)
        |> put_session(:user_email, user.email)
        |> redirect(to: page_path(conn, :index))
      else
        conn
        |> put_flash(:error, "Username or password incorrect !")
        |> render("index.html", changeset: changeset)
      end

    else
      conn
      |> put_flash(:error, "Username or password incorrect !")
      |> render("index.html", changeset: changeset)
    end


  end


  def signup(_conn, _params) do
  end

  def signout(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: auth_path(conn, :index))
  end


end
