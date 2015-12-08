defmodule Workshop.Exercise.Csv do
  use Workshop.Exercise

  @title "Csv"
  @weight 3000

  # Write an exercise description that make the user capable of solving the
  # given `@task`.
  @description """
  In this exercise we will create a simple CSV parser.

  ## Default arguemnts

  Functions can take default arguments - this is done with `\\` operator.

      def parse(filename, opts \\ []), do: #...

  Such a definition is equivalent to:

     def parse(filename), do: parse(filename, [])
     def parse(filename, opts), do: #...

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
  Create `Csv.parse/2` function that will take a filename as a first argument,
  and a keyword list of options as a second one.
  """

  @hint [
    "@todo, write a couple of hints for the solving this exercise"
  ]
end
