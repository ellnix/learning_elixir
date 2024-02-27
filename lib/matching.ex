Learning.chapter "Using a with statement"
with {:ok, n} = MathFunctions.math_api_call("hello")
do
  IO.puts n
end

Learning.chapter "Accessing and updating a nested Map"
parameters = %{
  "_csrf_token" => "UR99GwILHTtzbSBUYRwmBVpdeDY/AAAA3K70jEiO9UhgPVwh+d3WYw==",
  "_utf8" => "✓", 
  "user" => %{"name" => "Memphis Minnie", "password" => "[FILTERED]", "username" => "minnie"}
}

password = get_in(parameters, ["user", "password"])
IO.puts password

parameters = %{ parameters | "_csrf_token" => nil }
IO.inspect(parameters)

Learning.chapter "Accessing a list"
my_list = [1, 2, 3, 4]
[first | _] = my_list
IO.puts first
[_, second | _] = my_list
IO.puts second

Learning.chapter "Updating a map"
my_map = %{ name: "Mike", city: "NYC" }
my_map = %{ my_map | name: "John" }
IO.inspect my_map

Learning.chapter "String sigils"
IO.inspect ~w[hello world test]
IO.inspect ~w[hello world test]a
IO.inspect ~w[hello world test]c

Learning.chapter "Tail recursion with string"
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

Learning.chapter "FizzBuzz without control flow"

defmodule FizzBuzz do
  def upto(n) when n > 0, do: 1..n |> Enum.map(&(fizzwords/1))

  def fizzwords(n), do: fizzbuzz(n, rem(n, 3), rem(n, 5))
  def fizzbuzz(_, 0, 0), do: 'FizzBuzz'
  def fizzbuzz(_, 0, _), do: 'Fizz'
  def fizzbuzz(_, _, 0), do: 'Buzz'
  def fizzbuzz(n, _, _), do: n
end
IO.inspect FizzBuzz.upto(20)

Learning.chapter("Using case statements")

case [1, 2, 3] do
  [_x] -> IO.puts("Wrong match")
  [_a, _b] -> IO.puts("Wrong match")
  [a, a, _b] -> IO.puts("Wrong match")
  [a, b, c] -> IO.puts("Correct match: #{a}, #{b}, #{c}")
end

try do
  case 1 do
    0 -> IO.puts("Wrong match")
    2 -> IO.puts("Wrong match")
    3 -> IO.puts("Wrong match")
  end
rescue
  _e in CaseClauseError -> IO.puts("Failed to match!")
end

Learning.chapter("Raising errors")

try do
  raise("Random error")
rescue
  _e in RuntimeError -> IO.puts("raise defaults to RuntimeError")
end

try do
  raise(ArgumentError, "Specified error")
rescue
  _e in ArgumentError -> IO.puts("ArgumentError has been raised")
end

Learning.chapter("Parsing string to integer")

IO.inspect Integer.parse("ABC15", 16)
IO.inspect Integer.parse("ABC15", 14)
IO.inspect Integer.parse("ABC15")
IO.inspect Integer.parse("15ABC15")
try do
  IO.inspect String.to_integer("15ABC15")
rescue
  _e in ArgumentError -> IO.puts "String.to_integer is strict"
end
