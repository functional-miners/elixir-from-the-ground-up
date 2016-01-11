defmodule Workshop.Exercise.MyEnum do
  use Workshop.Exercise

  @title "My Enum"
  @weight 2000

  # Write an exercise description that make the user capable of solving the
  # given `@task`.
  @description ~S"""
  # Pattern matching and recursion

  Elixir (and Erlang) don't have assignments. Instead they use pattern matching.

  The program asks: what can I do to make this equality true?
  Specifically how to make what's **on the left** to match what's **on the right**?

      iex(1)> x = 1 # x gets bound to 1
      1
      iex(2)> 1 = x # x is already bound to 1, so match is met
      1

  With lists:

      iex(3)> x = [1,2,3]
      [1,2,3]

      iex(4)> [first, 2, 3] = [1,2,3]
      [1,2,3]
      iex(5)> first
      1

      iex(6)> [head | tail] = [1,2,3]
      [1,2,3]
      iex(7)> head
      1
      iex(8)> tail
      [2,3]

      iex(9)> [[a] | tail] = [[1], [2,3,4], [5,6]]
      [[1], [2, 3, 4], [5, 6]]
      iex(10)> a
      1

  Pattern matching works in functions:

      defmodule Lunch do
        def eat("cake"), do: "Wooh!"
        def eat(food), do: "Boring, I don't like #{food}"
      end

  We can match against a literal value like `"cake"`.

  We can also match against structures:

      defmodule MyMath do
        def sum([]), do: 0
        def sum([head|tail]) do
          head + sum(tail)
        end
      end

  This is, however, ineffective recursion, as we have to compute all results upfront.

  We have to use **tail recursion**.

      defmodule MyMath do
        def tail_sum(list), do: do_tail_sum(list, 0)

        defp do_tail_sum([], total), do: total
        defp do_tail_sum([head|tail], total) do
          do_tail_sum(tail, head + total)
        end
      end

  Every time the function recurses, it carries over the tail and the total,
  nothing more. Memory usage is constant over time.

  When constructing lists, one can also use a pattern often called
  **body-recursion**:

      defmodule MyEnum do
        def repeat(_elem, 0), do: []
        def repeat(elem, times), do: [elem | repeat(elem, times - 1)]
      end

  This is also optimized by the VM, and will use constant memory.

  # What's next?
  Get the task for this exercise by executing `mix workshop.task`. When you are
  done writing a solution it can be checked and verified using the
  `mix workshop.check` command.

  When the workshop check pass you can proceed to the next exercise by executing
  the `mix workshop.next` command.

  If you are confused you could try `mix workshop.hint`. Otherwise ask your
  instructor or follow the directions on `mix workshop.help`.
  """

  @task """
  In the `MyEnum` module implement functions:
    * `map/2` - working like `Enum.map/2`
    * `reverse/1` - working like `Enum.reverse/1`
    * `append/2` - working like `Kernel.++/2`
    * `length/1` - working like `Kernel.length/1`
  """

  @hint [
    "If you don't know how a particular function works, look up it's " <>
    "documentation in IEx with `h`.",
  ]
end
