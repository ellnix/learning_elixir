IO.puts "Enum (& Stream) tests"

Learning.chapter "Lazy evaluation with a stream"
# result = Enum.map(1..10_000_000, &(&1+1)) |> Enum.take(5)
result = Stream.map(1..10_000_000, &(&1+1)) |> Enum.take(5)
IO.inspect result

Learning.chapter "List comprehension format"
thing = for i <- [:hello, "world", :test], {_, count} <- [{:bananas, 5}, {:apples, 6}, {:grapes, 7}], is_atom(i), count > 5, into: [] do { i, count } end
IO.inspect thing

Learning.chapter "chunk_while/4 does not behave"

list = [1, 2, 3, 4, 10, 11, 12, 20, 21, 30, 32, 42, 43, 44, 45, 48, 49]

chunk_fun = fn
  elem, [] -> {:cont, [elem]}
  elem, [prev | _] = acc when prev + 1 == elem -> {:cont, [elem|acc]}
  elem, acc -> {:cont, Enum.reverse(acc), [elem]}
end

after_fun = fn
  [] -> {:cont, []}
  acc -> {:cont, Enum.reverse(acc), []}
end

IO.inspect Enum.chunk_while(list, [], chunk_fun, after_fun)

Learning.chapter "Map with reduce"

list = Enum.to_list(1..10)
IO.inspect Enum.reverse(Enum.reduce(list, [], fn elem, acc -> [elem * 2|acc] end))

IO.puts("Custom sigil")

Learning.chapter "Enum.reduce_while/3"

list = Enum.to_list(1..10)
IO.inspect Enum.reduce_while(list, 0, 
  fn 
    elem, acc when elem > 6 -> {:halt, acc}
    elem, acc -> {:cont, acc + elem}
  end
)

Learning.chapter "Enum.group_by/2"
IO.inspect Enum.group_by(list, fn elem -> rem(elem, 3) end)

Learning.chapter "Enum.into/2 (keyword list to map)"
kw_list = [a: 1, b: 2, c: 3, d: 4]
IO.inspect Enum.into(kw_list, Map.new)

Learning.chapter "Enum.into/3 (keyword list to map)"
kw_list = [a: 1, b: 2, c: 3, d: 4]
IO.inspect Enum.into(kw_list, Map.new, fn {k, v} -> { String.upcase(to_string(k)), v * 2 } end)
