defmodule MySigils do
  def sigil_p binary, [] do
    binary
    |> String.split
    |> Enum.join("/")
  end

  def sigil_p binary, [?u] do
    "https://www." <> (binary |> String.split |> Enum.join("/"))
  end
end
