defmodule Workshop.Exercise.HelloWorld do
  use Workshop.Exercise

  @title "Hello World"
  @weight 1000

  @description """
  Hello World!

  In this exercise you will test your Exilir setup and write your first hello
  world program.

  In Elixir every named function has to belong to a module. A module is defined
  with the `defmodule` macro like so:

      defmodule MyModule do
      end

  Notice that the name of the module is written in camel-case.

  Within the module you can define functions using the `def` macro:

      defmodule MyModule do
        def my_function do
        end
      end

  Notice that the function name `my_function` is written in lower-cased snake-case.

  Elixir is big on expressions, so you do not need a `return` statement. The
  function will just return the last evaluated expression.

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
    * Create a module called `Greeter`.

    * Create a function called `greeting` that will take as an argument a name,
      and say hello to that person.

          Greeter.greeting("Michał") == "Hello, Michał!"

    * Create a function called `say` that will take a name as an argument,
      use the `greeting/1` function to generate name, and print the greeting to the
      console.

    * Make the `greeting/1` function say something special to José.
      * Bonus points: don't use `if`, `case`, or `cond`.

  """

  @hint [
    "Check the `IO.puts/2` function",
    "You can write multiple function heads pattern-matching on arguments",
  ]
end
