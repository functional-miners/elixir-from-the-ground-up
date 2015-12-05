defmodule Workshop.Meta do
  use Workshop.Info

  # The human readable title of the workshop.
  @title "Elixir From The Ground Up"

  # The version number is used to verify what version of the workshop the user
  # is running.
  @version "0.0.1"
  @generator_version "0.5.1"

  # An optional url to the website of the workshop. If the website is a Git repo
  # on GitHub the help page will point to the GitHub issues page when the user
  # types `mix workshop.help`
  #
  # ie: `https://github.com/foo/bar` becomes `https://github.com/foo/bar/issues`
  @home nil

  # An optional short description of the workshop. Will get shown at places
  # where the long description would not fit, such as the `mix workshop` screen.
  # Set this to `false` if you want to suppress the missing shortdesc warning.
  @shortdesc nil

  # The description should state what the user will learn from this workshop.
  # Perhaps mention the intended audience.
  @description """
  Describe the workshop here.
  """

  # The introduction should welcome the user to the workshop, set the
  # expectations, and inform the user to execute the next-command to get to the
  # first exercise.
  @introduction """
  This is the introduction and it will get displayed when the workshop has been
  started.

  Don't forget to inform the user to write `mix workshop.next` to get to the
  first exercise.
  """

  # The debriefing message will get shown when the workshop is over.
  # This would be a good opportunity to congratulate the user; perhaps thank the
  # user and; and ask for feedback.
  @debriefing """
  You have completed the last exercise. Congratulations!
  """
end
