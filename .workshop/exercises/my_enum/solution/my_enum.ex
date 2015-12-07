defmodule MyEnum do
  def map([], _mapper), do: []
  def map([head | tail], mapper), do: [mapper.(head) | map(tail, mapper)]

  def reverse([], reversed), do: reversed
  def reverse([head | tail], reversed), do: reverse(tail, [head | reversed])

  def reverse(to_reverse), do: reverse(to_reverse, [])

  def append([], rest), do: rest
  def append([head | tail], rest), do: [head | append(tail, rest)]

  def length(list), do: length(list, 0)

  defp length([], count), do: count
  defp length([_head | tail], count), do: length(tail, count + 1)
end
