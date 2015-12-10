defmodule Rpn do
  def eval(string) do
    string
    |> tokenize
    |> reduce
    |> extract_result
  end

  defp tokenize(string) do
    String.split(string)
  end

  defp reduce(tokens) do
    Enum.reduce(tokens, [], &do_eval/2)
  end

  defp extract_result([result]), do: result
  defp extract_result(results) do
    raise("Expected to finish with terminal value, instead got: #{inspect results}")
  end

  @binary ~w(+ - * / ^)
  @unary  ~w(ln log10)
  @reducing ~w(sum prod)

  defp do_eval(op, [rhs, lhs | rest]) when op in @binary,
    do: [eval_op(op, lhs, rhs) | rest]
  defp do_eval(op, [num | rest]) when op in @unary,
    do: [eval_op(op, num) | rest]
  defp do_eval(op, stack) when op in @unary or op in @binary,
    do: raise("Unexpected operands in stack `#{inspect stack}` for operator: `#{op}`")
  defp do_eval(op, stack) when op in @reducing,
    do: [reduce_op(op, stack)]
  defp do_eval(num, stack),
    do: [parse(num) | stack]

  defp eval_op("+", lhs, rhs), do: lhs + rhs
  defp eval_op("-", lhs, rhs), do: lhs - rhs
  defp eval_op("*", lhs, rhs), do: lhs * rhs
  defp eval_op("/", lhs, rhs), do: lhs / rhs
  defp eval_op("^", lhs, rhs), do: :math.pow(lhs, rhs)

  defp eval_op("ln",    num), do: :math.log(num)
  defp eval_op("log10", num), do: :math.log10(num)

  defp reduce_op("sum",  stack), do: Enum.reduce(stack, 0, &Kernel.+/2)
  defp reduce_op("prod", stack), do: Enum.reduce(stack, 1, &Kernel.*/2)

  defp parse(num) do
    case Float.parse(num) do
      {float, ""} -> float
      _           -> raise("Could not parse `#{num}`")
    end
  end
end
