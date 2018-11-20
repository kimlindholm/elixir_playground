defmodule PlaygroundWebWeb.PageController do
  use PlaygroundWebWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
