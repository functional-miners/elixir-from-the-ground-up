defmodule Workshop.Exercise.IexCheck.Helper do
  def exec(_solution_dir) do
    # Locate and load and perhaps start the users solution.

    # The following example assumes that the user solution is located
    # in a file called *exercise.exs*:

    # "exercise.exs"
    # |> Path.expand(solution_dir)
    # |> Code.require_file

    # load and run the solution checker
    Code.require_file("check.exs", __DIR__)

    Workshop.Exercise.IexCheck.run()
  end
end
