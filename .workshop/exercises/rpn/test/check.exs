defmodule Workshop.Exercise.RpnCheck do
  use Workshop.Validator

  @simple [
    {1.0,              "2 _ 3 +"},
    {5.0,              "2 3 +"},
    {87.0,             "90 3 -"},
    {-4.0,             "10 4 3 + 2 * -"},
    {-2.0,             "10 4 3 + 2 * - 2 /"},
    {4037.0,           "90 34 12 33 55 66 + * - + - "},
    {8.0,              "2 3 ^"},
    {:math.sqrt(2),    "2 0.5 ^"},
    {:math.log(2.7),   "2.7 ln"},
    {:math.log10(2.7), "2.7 log10"},
  ]

  @extra [
    {50.0,   "10 10 10 20 sum"},
    {10.0,   "10 10 10 20 sum 5 /"},
    {1000.0, "10 10 20 0.5 prod"},
  ]

  @failing [
    "90 34 12 33 55 66 + * - +",
    "90 90",
    "+",
    "10 -",
  ]

  for {expected, calculation} <- @simple do
    verify calculation do
      try do
        case Rpn.eval(unquote(calculation)) do
          unquote(expected) ->
            :ok
          other ->
            {:error,
             "Expected: #{inspect unquote(calculation)} to result in " <>
             "#{unquote(expected)}, instead got: #{other}."}
        end
      rescue
        exception ->
          {:error,
           "When calculating #{inspect unquote(calculation)} got exection: " <>
           Exception.message(exception)}
      end
    end
  end

  for {expected, calculation} <- @extra do
    verify calculation do
      try do
        case Rpn.eval(unquote(calculation)) do
          unquote(expected) ->
            :ok
          other ->
            {:warning,
             "Expected: #{inspect unquote(calculation)} to result in " <>
               "#{unquote(expected)}, instead got: #{other}."}
        end
      rescue
        exception ->
          {:warning,
           "When calculating #{inspect unquote(calculation)} got exection: " <>
           Exception.message(exception)}
      end
    end
  end

  for calculation <- @failing do
    verify calculation do
      try do
        Rpn.eval(unquote(calculation))
      rescue
        _ ->
          :ok
      else
        _ ->
          {:error, "Expected #{inspect unquote(calculation)} to fail"}
      end
    end
  end
end
