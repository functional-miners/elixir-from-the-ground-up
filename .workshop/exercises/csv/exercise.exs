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

  ## Streams

  While all operations in `Enum` module are eager (they iterate through whole
  collection right away), the ones in `Stream` module are lazy (processed one
  by one).

  Streams are executed when passed to the `Stream.run/1` function or when
  passed to one of the functions in the `Enum` module.

  Streams work not only with regular collections, but also with resources
  like files, database coursors, and others.

  Try using a streaming solution!

  ## Keywords

  Most often additional options are passed to functions as keywords.

  Keywords are lists of two element tuples, where first element is an atom, and
  the second one is any term.

  Because keywords are so common, Elixir has special syntactic sugar for them:

     [{:key, "value"}] == [key: "value"]

  When a keyword list is a last argument to a function brackets can be ommited:

     String.split(string, trim: true)

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
  Create `Csv.parse/2` function that will take a filename as a first argument,
  and a keyword list of options as a second one.
  """

  @hint [
    "@todo, write a couple of hints for the solving this exercise"
  ]
end
