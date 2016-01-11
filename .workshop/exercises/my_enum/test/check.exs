 defmodule Tracer do
  use GenServer

  def start(), do: GenServer.start(__MODULE__, [])

  def trace(who, modules, functions), do: GenServer.call(who, {:trace, modules, functions})
  def clear(who), do: GenServer.call(who, :clear)

  def calls(who), do: GenServer.call(who, :get_calls)

  def init([]) do
    :erlang.trace(:all, true, [:call])

    {:ok, %{ :modules => [], :functions => [], :calls => [] }}
  end

  def handle_call(:get_calls, _from, state) do
    {:reply, state[:calls], state}
  end

  def handle_call({:trace, modules, functions}, _from, state) do
    for module <- modules do
      for function <- functions do
        :erlang.trace_pattern({module, function, :_}, [{:_, [], [{:return_trace}]}])
      end
    end

    {:reply, :traced, %{ state | :functions => functions, :modules => modules }}
  end

  def handle_call(:clear, _from, state) do
    for module <- state[:modules] do
      for function <- state[:functions] do
        :erlang.trace_pattern({module, function, :_}, false)
      end
    end

    {:reply, :cleared, %{ state | :functions => [], :modules => [], :calls => [] }}
  end

  def handle_info({:trace, _, :call, {_mod, call, _args}}, state) do
    {:noreply, %{ state | :calls => state[:calls] ++ [ call ] }}
  end

  def handle_info(_, state) do
    {:noreply, state}
  end
end

defmodule Workshop.Exercise.MyEnumCheck do
  use Workshop.Validator

  defmacrop check_the_same(expected, given) do
    quote do
      if unquote(expected) == unquote(given) do
        :ok
      else
        {:error,
         "Expected `#{unquote(Macro.to_string(given))}`to have the same result " <>
           "as `#{unquote(Macro.to_string(expected))}` - " <>
           "#{inspect unquote(expected)}, instead got: #{inspect unquote(given)}."}
      end
    end
  end

  defmacrop should_not_use(module, function, call) do
    quote do
      {:ok, pid} = Tracer.start()

      Tracer.trace(pid, [ unquote(module) ], [ unquote(function) ])
      unquote(call)

      :timer.sleep(100)
      calls = Tracer.calls(pid)

      result = if length(calls) > 0 do
        {:error,
         "Call to `#{unquote(Macro.to_string(module))}.#{unquote(Macro.to_string(function))}` detected. " <>
           "You cannot use those function in your `#{unquote(Macro.to_string(call))}` implementation."}
      else
        :ok
      end

      Tracer.clear(pid)
      Process.exit(pid, :normal)

      result
    end
  end

  verify "map with integers" do
    check_the_same(Enum.map([1, 2, 3], &(&1+1)),
                   MyEnum.map([1, 2, 3], &(&1+1)))
  end

  verify "map with strings" do
    check_the_same(Enum.map(~w(a b c), &String.upcase/1),
                   MyEnum.map(~w(a b c), &String.upcase/1))
  end

  verify "append" do
    check_the_same([1, 2, 3] ++ [4, 5, 6],
                   MyEnum.append([1, 2, 3], [4, 5, 6]))
  end

  verify "length" do
    check_the_same(length(:lists.seq(1, 10000)),
                   MyEnum.length(:lists.seq(1, 10000)))
  end

  verify "reverse" do
    check_the_same(Enum.reverse(:lists.seq(1, 10000)),
                   MyEnum.reverse(:lists.seq(1, 10000)))
  end

  verify "do not use :erlang.++/2 function in MyEnum.append/2" do
    should_not_use(:erlang, :'++', MyEnum.append([1], [2]))
  end

  verify "do not use Kernel.length/1 function in MyEnum.length/1" do
    should_not_use(Kernel, :length, MyEnum.length([1, 2, 3]))
  end

  verify "do not use Enum.map/2 function in MyEnum.map/2" do
    should_not_use(Enum, :map, MyEnum.map(["a"], &String.upcase/1))
  end

  verify "do not use Enum.reverse/2 function in MyEnum.reverse/2" do
    should_not_use(Enum, :reverse, MyEnum.reverse([1, 2, 3]))
  end
end
