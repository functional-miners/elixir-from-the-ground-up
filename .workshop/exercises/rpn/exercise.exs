defmodule Workshop.Exercise.Rpn do
  use Workshop.Exercise

  @title "Rpn"
  @weight 4000

  @description """
  In this exercise we'll create a simple RPN calculator.

  ## RPN - Reverse Polish Notation

  It is a mathematical notation in which every operator follows all of its operands, in contrast to Polish notation,
  which puts the operator in the prefix position. It is also known as postfix notation and is parenthesis-free as
  long as operator arities are fixed. The description "Polish" refers to the nationality of logician Jan Łukasiewicz,
  who invented (prefix) Polish notation in the 1920s.

  Example:

  `"3 4 +"` should return `7`

  How to calculate that?

  All operations should use stack - first we tokenize the string and extract all tokens separately. By tokens we
  mean numbers (whole numbers, not digits - operands) and operators. Each of allowed
  operators has arity - they are either *unary or binary*.

  After extracting list of tokens, we go one by one and if we will find:

  * a *number* - we should push it to the stack
  * an *unary/binary operator* - we should pop as many arguments it requires from the stack, calculate the
    result and push it again on stack

  At the end, we should have only one element on the stack which will be the final result.

  ## Supported operations

  Numbers can be either integers or decimals.

  * Binary operators:
    * Addition `+`
    * Subtraction `-`
    * Multiplication `*`
    * Division `/`
    * Power `^`
  * Unary operators:
    * Natural logarithm `ln`
    * Decimal logarithm `log10`
    * Negation `_`

  As an extra task you can implement the "reducing operators" - they take the whole
  stack and apply the operation starting with a *neutral element*
  (e.g. `1` for multiplication)

  * Reducing operators:
    * Summation `sum`
    * Product `prod`

  ## What's next?

  Get the task for this exercise by executing `mix workshop.task`. When you are
  done writing a solution it can be checked and verified using the
  `mix workshop.check` command.

  When the workshop check pass you can proceed to the next exercise by executing
  the `mix workshop.next` command.

  If you are confused you could try `mix workshop.hint`. Otherwise ask your
  instructor or follow the directions on `mix workshop.help`.
  """

  @task """
  Create `Rpn.eval/1` function that will accept a string in a form of RPN like `"2 3 +"`,
  and it will return the result of evaluation as a number - in above case it should return `5.0`.
  """

  @hint [
    "To parse a number you can use `Float.parse/1`",
    "If you want to implement `ln`, `^` or `log10` you should take a look on *Erlang* `:math` module.",
    "You can use a list as a stack",
    "Have a look at `Enum.reduce/2`"
  ]
end
