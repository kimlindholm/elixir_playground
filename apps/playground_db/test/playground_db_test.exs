defmodule PlaygroundDbTest do
  use ExUnit.Case
  doctest PlaygroundDb

  test "greets the world" do
    assert PlaygroundDb.hello() == :world
  end
end
