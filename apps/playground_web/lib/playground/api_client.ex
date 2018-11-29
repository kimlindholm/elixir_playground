defmodule Playground.ApiClient do
  @moduledoc """
  Shared configuration for REST API clients.
  """

  defmacro __using__(_opts) do
    quote do
      use Tesla

      @base_url Application.get_env(:playground_web, :api_base_url)
      @username Application.get_env(:playground_web, :api_username)
      @password Application.get_env(:playground_web, :api_password)

      plug Tesla.Middleware.BaseUrl, @base_url
      plug Tesla.Middleware.BasicAuth, username: @username, password: @password
      plug Tesla.Middleware.FollowRedirects
      plug Tesla.Middleware.JSON
      plug Tesla.Middleware.Compression
      plug Tesla.Middleware.Timeout, timeout: 5_000
      plug Tesla.Middleware.Retry, delay: 500, max_retries: 10
      plug Tesla.Middleware.Logger
    end
  end
end
