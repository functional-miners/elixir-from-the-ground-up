defmodule Greeter do
  def greeting("José"), do: "Welcome, José!"
  def greeting(name),   do: "Hello, #{name}!"

  def say(name) do
    name
    |> greeting
    |> IO.puts
  end
end
