defmodule PlaygroundApiTest do
  use ExUnit.Case
  doctest PlaygroundApi

  test "greets the world" do
    assert PlaygroundApi.hello() == :world
  end
end
