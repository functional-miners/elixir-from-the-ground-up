defmodule Workshop.Exercise.Iex do
  use Workshop.Exercise

  @title "IEx"
  @weight 500

  # Write an exercise description that make the user capable of solving the
  # given `@task`.
  @description """
  In the exercise you will learn about the Elixir's interactive shell, and how
  to find documentation.

  IEx is Elixir's interactive REPL.

  It can be run simply with `iex` on the command line. You can use the `-r` switch
  to load a file inside your session.

  Useful functions:

    * `h` shows a list of all available commands
    * `h <function name>` prints documentation for a given function or module
    * `c <path>` compiles the source file at given path
    * `r <module>` recompiles and reloads the given module

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
  * Open up IEx and play a little bit with it.
  * Try looking up documentation for `Enum.map`
  * Tru lookup up documentation for the `h` helper command
  """

  @hint []
end
