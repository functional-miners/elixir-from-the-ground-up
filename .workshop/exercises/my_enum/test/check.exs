defmodule Workshop.Exercise.MyEnumCheck do
  use Workshop.Validator

  defmacrop check_the_same(expected, given) do
    quote do
      if unquote(expected) == unquote(given) do
        :ok
      else
        {:error,
         "Expected `#{unquote(Macro.to_string(given))}`to have the same result " <>
           "as `#{unquote(Macro.to_string(expected))}` - " <>
           "#{inspect unquote(expected)}, instead got: #{inspect unquote(given)}."}
      end
    end
  end

  verify "map with integers" do
    check_the_same(Enum.map([1, 2, 3], &(&1+1)),
                   MyEnum.map([1, 2, 3], &(&1+1)))
  end

  verify "map with strings" do
    check_the_same(Enum.map(~w(a b c), &String.upcase/1),
                   MyEnum.map(~w(a b c), &String.upcase/1))
  end

  verify "append" do
    check_the_same([1, 2, 3] ++ [4, 5, 6],
                   MyEnum.append([1, 2, 3], [4, 5, 6]))
  end

  verify "reverse" do
    check_the_same(length(:lists.seq(1, 10000)),
                   MyEnum.length(:lists.seq(1, 10000)))
  end
end
