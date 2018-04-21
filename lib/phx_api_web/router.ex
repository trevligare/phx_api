defmodule PhxApiWeb.Router do
  use PhxApiWeb, :router

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

  scope "/", PhxApiWeb do
    pipe_through :browser # Use the default browser stack
  end
  # Other scopes may use custom stacks.
  scope "/api", PhxApiWeb do
    pipe_through :api

    # post "/v1/reports", ReportController, :create
  end
end
