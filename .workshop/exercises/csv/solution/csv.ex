defmodule Csv do
  def parse(filename, opts \\ []) do
    filename
    |> File.stream!
    |> Stream.map(&String.strip/1)
    |> split_lines(Keyword.get(opts, :separator, ","))
    |> with_header(Keyword.get(opts, :header, false))
  end

  defp split_lines(lines, separator) do
    Enum.map(lines, &String.split(&1, separator))
  end

  defp with_header(lines, false) do
    lines
  end

  defp with_header([header | lines], true) do
    lines
    |> Enum.map(&Enum.zip(header, &1))
    |> Enum.map(&Enum.into(&1, %{}))
  end
end
