defmodule LearningElixirTest do
  use ExUnit.Case
  doctest LearningElixir
  doctest MathFunctions

  test "greets the world" do
    assert LearningElixir.hello() == :world
  end
end
