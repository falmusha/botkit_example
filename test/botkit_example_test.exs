defmodule BotKitExampleTest do
  use ExUnit.Case
  doctest BotKitExample

  test "greets the world" do
    assert BotKitExample.hello() == :world
  end
end
