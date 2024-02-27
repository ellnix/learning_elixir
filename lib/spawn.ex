Learning.chapter("spawn/1")

defmodule Calculations do
  def stupid_calculation do
    1..100_000
    |> Enum.map(&(&1 * 2))
    |> Enum.take(5)
  end

  def smart_calculation do
    1..10_000_000
    |> Stream.map(&(&1 * 2))
    |> Enum.take(5)
    |> Enum.sum()
  end

  def very_smart_calculation(n, multiplier, process) do
    result =
      1..10_000_000
      |> Stream.map(&(&1 * multiplier))
      |> Enum.take(n)
      |> Enum.sum()

    send(process, result)
  end
end

parent = self()
spawn(fn -> send(parent, Calculations.stupid_calculation()) end)

Stream.repeatedly(fn -> spawn(fn -> send(parent, Calculations.smart_calculation()) end) end)
|> Enum.take(5)

Enum.each(1..6, fn _ ->
  receive do
    a -> IO.inspect(a)
  end
end)

Learning.chapter("spawn/3")

Stream.repeatedly(fn -> spawn(Calculations, :very_smart_calculation, [5, 3, parent]) end)
|> Enum.take(5)

Enum.each(1..5, fn _ ->
  receive do
    a -> IO.inspect(a)
  end
end)
