defmodule GeneratorWeb.Router do
  use GeneratorWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GeneratorWeb do
    pipe_through :api
  end
end
