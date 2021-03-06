defmodule PlaygroundApi.BasicAuth do
  @moduledoc """
  A Plug reponsible for HTTP basic authentication.
  """

  import Plug.Conn

  @realm "Basic realm=\"" <> Application.get_env(:playground_api, :basic_auth_realm) <> "\""

  def init(opts), do: opts

  def call(conn, correct_auth) do
    case get_req_header(conn, "authorization") do
      ["Basic " <> attempted_auth] -> verify(conn, attempted_auth, correct_auth)
      _ -> unauthorized(conn)
    end
  end

  defp verify(conn, attempted_auth, username: username, password: password) do
    if Plug.Crypto.secure_compare(encode(username, password), attempted_auth) do
      conn
    else
      unauthorized(conn)
    end
  end

  defp encode(username, password), do: Base.encode64(username <> ":" <> password)

  defp unauthorized(conn) do
    conn
    |> put_resp_header("www-authenticate", @realm)
    |> send_resp(401, "Unauthorized")
    |> halt()
  end
end
