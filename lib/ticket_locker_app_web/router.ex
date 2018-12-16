defmodule TicketLockerAppWeb.Router do
  use TicketLockerAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TicketLockerAppWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/code", PageController, :code
  end

  # Other scopes may use custom stacks.
  # scope "/api", TicketLockerAppWeb do
  #   pipe_through :api
  # end
end
