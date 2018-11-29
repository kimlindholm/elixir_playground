defmodule Playground.Posts.PostClient do
  @moduledoc """
  API client for Posts.
  """

  use Playground.ApiClient

  def list_posts(query) when is_list(query) do
    get("/posts", query: query)
  end

  def list_posts(_), do: list_posts()

  def list_posts do
    get("/posts")
  end
end
