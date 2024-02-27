defmodule LearningElixirTest do
  use ExUnit.Case
  doctest MathFunctions

  test "raises error" do
    try do
      MathFunctions.raise_error
      refute true
    rescue 
      _ in RuntimeError -> assert true
    end
  end
end
