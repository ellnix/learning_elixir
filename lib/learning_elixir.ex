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

  def double(n \\ 1), do: n * 2

  def math_api_call(url), do: {:ok, 5}
end

IO.puts MathFunctions.factorial(5)
IO.puts MathFunctions.double(10)
IO.puts MathFunctions.double

with {:ok, n} = MathFunctions.math_api_call("hello")
do
  IO.puts n
end

parameters = %{
  "_csrf_token" => "UR99GwILHTtzbSBUYRwmBVpdeDY/AAAA3K70jEiO9UhgPVwh+d3WYw==",
  "_utf8" => "✓", 
  "user" => %{"name" => "Memphis Minnie", "password" => "[FILTERED]", "username" => "minnie"}
}

password = get_in(parameters, ["user", "password"])
IO.puts password
