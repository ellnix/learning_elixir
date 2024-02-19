defmodule LearningElixir do
  @moduledoc """
  Documentation for `LearningElixir`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> LearningElixir.hello()
      :world

  """
  def hello do
    :world
  end
end

defmodule MathFunctions do
  def factorial(0), do: 1

  def factorial(n) when n > 0 do
    n * factorial(n-1)
  end
end

IO.puts MathFunctions.factorial(5)
