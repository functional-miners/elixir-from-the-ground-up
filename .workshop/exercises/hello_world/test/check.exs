defmodule Workshop.Exercise.HelloWorldCheck do
  use Workshop.Validator
  import ExUnit.CaptureIO

  verify "should have module Greeter" do
    if Code.ensure_loaded(Greeter) do
      :ok
    else
      {:error, "Where is your Greeter module?"}
    end
  end

  verify "should produce greeting" do
    case Greeter.greeting("Michał") do
      "Hello, Michał!" ->
        :ok
      other ->
        {:error, ~s{It didn't greet `"Michał" with `"Hello, Michał!", but with: `#{inspect other}`}}
    end
  end

  verify "should print greeting" do
    case capture_io(fn -> Greeter.say("Michał") end) do
      "Hello, Michał!\n" ->
        :ok
      other ->
        {:error, ~s{It didn't greet `"Michał" with `"Hello, Michał!", but with: `#{inspect other}`}}
    end
  end

  verify "should have special greeting for José" do
    case Greeter.greeting("José") do
      "Hello, José!" ->
        {:error, "José is greeted exactly as everybody else!"}
      other ->
        if String.contains?(other, "José") do
          :ok
        else
          {:error, "When greeting José, you should say his name!"}
        end
    end
  end
end
