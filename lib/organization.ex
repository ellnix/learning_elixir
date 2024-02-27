defmodule MathFunctions do
  @moduledoc """
  A collection of math functions
  """

  def factorial(0), do: 1

  @doc """
  Recursive factorial function

  ## Examples

      iex> MathFunctions.factorial(5)
      120

  """
  def factorial(n) when n > 0 do
    n * factorial(n-1)
  end

  @doc """
  Doubles the provided number
  """
  def double(n \\ 1), do: n * 2

  @doc """
  Makes an API call
  """
  def math_api_call(_url), do: {:ok, 5}

  @doc """
  Raises an error
  """
  def raise_error(), do: raise("Math went wrong")
end

Learning.chapter "Recursive function"
IO.puts MathFunctions.factorial(5)

Learning.chapter "Function with default value"
IO.puts MathFunctions.double(10)
IO.puts MathFunctions.double

Learning.chapter("Function with default params and single param")

defmodule Params do
  def print(a, b \\ 13)

  def print(a, 20), do: IO.puts("One param: #{a} and 20")

  def print(a, b), do: IO.puts("Two params: #{a} #{b}")
end

Learning.chapter "Custom sigils"

import MySigils

IO.puts ~p/hello world/
IO.puts ~p/hello.com world/u
