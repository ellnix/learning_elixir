defmodule LearningElixirTest do
  use ExUnit.Case
  doctest LearningElixir
  doctest MathFunctions

  test "greets the world" do
    assert LearningElixir.hello() == :world
  end

  test "raises error" do
    try do
      MathFunctions.raise_error
      refute true
    rescue 
      _ in RuntimeError -> assert true
    end
  end
end
