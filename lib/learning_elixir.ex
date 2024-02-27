defmodule Learning do
  @moduledoc """
  Convenience methods
  """

  def chapter(title) do
    IO.puts("=====#{String.duplicate("=", String.length(title))}===")
    IO.puts("=== #{title} ===")
    IO.puts("=====#{String.duplicate("=", String.length(title))}===")
  end
end



