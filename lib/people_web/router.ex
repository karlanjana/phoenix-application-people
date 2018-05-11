defmodule PeopleWeb.Router do
  use PeopleWeb, :router

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

  scope "/", PeopleWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PersonController, :index
    get "/create", PersonController, :new
    post "/create", PersonController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", PeopleWeb do
  #   pipe_through :api
  # end
end
