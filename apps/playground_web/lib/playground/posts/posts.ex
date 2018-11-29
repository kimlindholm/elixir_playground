defmodule Playground.Posts do
  @moduledoc """
  The Posts context.
  """

  alias Playground.Posts.PostClient

  @doc """
  Returns the list of latest posts with comments.

  ## Examples
      iex> list_latest_posts()
      {:ok,
        [
          %{"id" => 1, "content" => "New post", "comments" => []},
          ...
        ]
      }
  """
  def list_latest_posts do
    query = [sort: "-id", page: [limit: 3, offset: 0]]

    with {:ok, resp} <- PostClient.list_posts(query),
         status <- resp.status,
         _ when status < 400 <- {:error, status, resp.body},
         %{"posts" => posts} <- resp.body |> Jason.decode!() do
      {:ok, posts}
    else
      {:error, code, msg} ->
        {:error, code, msg}

      {:error, msg} ->
        {:error, nil, msg}
    end
  end
end
