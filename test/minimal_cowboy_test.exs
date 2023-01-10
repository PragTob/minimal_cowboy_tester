defmodule MinimalCowboyTest do
  use ExUnit.Case
  doctest MinimalCowboy

  test "greets the world" do
    assert MinimalCowboy.hello() == :world
  end
end
