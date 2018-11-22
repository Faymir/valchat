defmodule Valchat.Router do
  use Valchat.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers

    plug(Valchat.Plugs.SetUser)

  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Valchat do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get "/signin", AuthController, :index
    post "/signin", AuthController, :signin
    get "/signout", AuthController, :signout


  end

  # Other scopes may use custom stacks.
  # scope "/api", Valchat do
  #   pipe_through :api
  # end
end
