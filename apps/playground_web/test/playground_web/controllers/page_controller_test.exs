defmodule PlaygroundWeb.PageControllerTest do
  use PlaygroundWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Latest Posts"
  end
end
