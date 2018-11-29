defmodule PlaygroundApi.Endpoint do
  @moduledoc """
  A Plug responsible for logging request info, parsing request bodies as JSON,
  matching routes, and dispatching responses.
  """

  import Ecto.Query, only: [from: 1], warn: false
  use Plug.Router
  use Inquisitor
  use Inquisitor.JsonApi.{Page, Sort}
  alias PlaygroundDb.Posts.Post
  alias PlaygroundDb.Repo

  @username Application.get_env(:playground_api, :basic_auth_username)
  @password Application.get_env(:playground_api, :basic_auth_password)

  @whitelist ~w(id content comments)

  plug(PlaygroundApi.BasicAuth, username: @username, password: @password)
  plug(Plug.Logger)
  plug(:match)
  plug(Plug.Parsers, parsers: [:json], json_decoder: Jason)
  plug(:dispatch)

  get "/api/v1/posts" do
    send_resp(conn, 200, list_posts(conn))
  end

  def build_query(query, attr, value, _conn) when attr in @whitelist do
    Ecto.Query.where(
      query,
      [r],
      field(r, ^String.to_existing_atom(attr)) == ^value
    )
  end

  defp list_posts(conn) do
    posts =
      Post
      |> build_query(conn, conn.params)
      |> Repo.all()
      |> Repo.preload(:comments)

    render("index.json", %{posts: posts})
  end

  defp render("index.json", %{posts: posts}) do
    Jason.encode!(%{posts: posts})
  end

  match _ do
    send_resp(conn, 404, "No route matches the request")
  end
end
