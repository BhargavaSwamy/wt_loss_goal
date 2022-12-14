defmodule BmiCalcWeb.Router do
  use BmiCalcWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {BmiCalcWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BmiCalcWeb do
    pipe_through :browser

    get "/", PageController, :index
    post "/", PageController, :result
  end

  # Other scopes may use custom stacks.
  # scope "/api", BmiCalcWeb do
  #   pipe_through :api
  # end
end
