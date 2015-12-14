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
  mean numbers (whole numbers, not digits - operands) and operators. Each of operator has arity - *unary, binary or
  it is a reducing operator*.

  After extracting list of tokens, we go one by one and if we will find:

  * a *number* - we should push it to the stack
  * an *unary/binary operator* - we should pops as many arguments it requires from the stack, calculate the
    result and push it again on stack
  * a *reducing operator* - we should take all numbers from stack and apply operator to all of them using *neutral
    element* as a starting point (e.g. for multiplication, we call `1` a neutral element).

  At the end, we should have only one element on the stack which will be the final result.

  ## Supported operations

  * Binary operators:
    * Addition `+`
    * Subtraction `-`
    * Multiplication `*`
    * Division `/`
    * Power `^`
  * Unary operators:
    * `ln`
    * `log10`
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
  and it will return a result of whole expression as a number - in above case it should return `5`.
  """

  @hint [
    "If you want to implement `ln`, `^` or `log10` you should take a look on *Erlang* `:math` module."
  ]
end
