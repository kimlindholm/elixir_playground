defmodule PlaygroundWeb.PageController do
  use PlaygroundWeb, :controller
  alias Playground.Posts

  def index(conn, _params) do
    with {:ok, posts} <- Posts.list_latest_posts() do
      render(conn, "index.html", posts: posts)
    else
      {:error, code, msg} ->
        render(conn, "index.html", error_code: code, error_msg: msg)
    end
  end
end
