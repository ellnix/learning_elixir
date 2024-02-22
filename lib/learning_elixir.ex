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

  def math_api_call(_url), do: {:ok, 5}
end

IO.puts "Recursive function"
IO.puts MathFunctions.factorial(5)

IO.puts "Function with default value"
IO.puts MathFunctions.double(10)
IO.puts MathFunctions.double

IO.puts "Using a with statement"
with {:ok, n} = MathFunctions.math_api_call("hello")
do
  IO.puts n
end

IO.puts "Accessing and updating a nested Map"
parameters = %{
  "_csrf_token" => "UR99GwILHTtzbSBUYRwmBVpdeDY/AAAA3K70jEiO9UhgPVwh+d3WYw==",
  "_utf8" => "✓", 
  "user" => %{"name" => "Memphis Minnie", "password" => "[FILTERED]", "username" => "minnie"}
}

password = get_in(parameters, ["user", "password"])
IO.puts password

parameters = %{ parameters | "_csrf_token" => nil }
IO.inspect(parameters)

IO.puts "Accessing a list"
my_list = [1, 2, 3, 4]
[first | _] = my_list
IO.puts first
[_, second | _] = my_list
IO.puts second

IO.puts "Updating a map"
my_map = %{ name: "Mike", city: "NYC" }
my_map = %{ my_map | name: "John" }
IO.inspect my_map

IO.puts "Lazy evaluation with a stream"
# result = Enum.map(1..10_000_000, &(&1+1)) |> Enum.take(5)
result = Stream.map(1..10_000_000, &(&1+1)) |> Enum.take(5)
IO.inspect result

IO.puts "List comprehension format"
thing = for i <- [:hello, "world", :test], {_, count} <- [{:bananas, 5}, {:apples, 6}, {:grapes, 7}], is_atom(i), count > 5, into: [] do { i, count } end
IO.inspect thing

IO.puts "String sigils"
IO.inspect ~w[hello world test]
IO.inspect ~w[hello world test]a
IO.inspect ~w[hello world test]c

IO.puts "Tail recursion with string"
defmodule StringStuff do
  def each(string, func) when is_binary(string) do
    _each(string, func)
  end
  defp _each(<<head::utf8, tail::binary>>, func) do
    func.(head)
    _each(tail, func)
  end

  defp _each(<<>>, _func), do: []
end

StringStuff.each("hello", &(IO.puts/1))

IO.puts "FizzBuzz without control flow"

defmodule FizzBuzz do
  def upto(n) when n > 0, do: 1..n |> Enum.map(&(fizzwords/1))

  def fizzwords(n), do: fizzbuzz(n, rem(n, 3), rem(n, 5))
  def fizzbuzz(_, 0, 0), do: 'FizzBuzz'
  def fizzbuzz(_, 0, _), do: 'Fizz'
  def fizzbuzz(_, _, 0), do: 'Buzz'
  def fizzbuzz(n, _, _), do: n
end
IO.inspect FizzBuzz.upto(20)
