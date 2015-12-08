defmodule Workshop.Exercise.CsvCheck do
  use Workshop.Validator

  def tmp_path do
    case Workshop.locate_root do
      {:ok, root, _exercise} ->
        Path.join(root, "tmp")
      {:ok, root} ->
        Path.join(root, "tmp")
      {:error, reason} ->
        raise(reason)
    end
  end

  defmacro in_tmp(fun) do
    path = Path.join([tmp_path, "#{__CALLER__.module}", "#{elem(__CALLER__.function, 0)}"])
    quote do
      path = unquote(path)
      File.rm_rf!(path)
      File.mkdir_p!(path)
      File.cd!(path, fn -> unquote(fun).(path) end)
    end
  end

  def with_tmp_file(content, fun) do
    in_tmp(fn path ->
      file = Path.join(path, "test.csv")
      File.write!(file, content)
      fun.(file)
    end)
  end

  @csv """
  one,two,three
  1,2,3
  a,b,c
  """

  @csv_parsed [["one", "two", "three"], ["1", "2", "3"], ["a", "b", "c"]]

  @csv_parsed_header [
    %{"one" => "1", "two" => "2", "three" => "3"},
    %{"one" => "a", "two" => "b", "three" => "c"},
  ]

  verify "without header" do
    with_tmp_file(@csv, fn file ->
      case Csv.parse(file, header: false, separator: ",") do
        @csv_parsed ->
          :ok
        other ->
          {:error, """
          When parsing:

          #{@csv}

          expected: `#{inspect @csv_parsed}`, got: `#{inspect other}`
          """}
      end
    end)
  end

  verify "default settings" do
    with_tmp_file(@csv, fn file ->
      case Csv.parse(file) do
        @csv_parsed ->
          :ok
        other ->
          {:error, """
          When parsing:

          #{@csv}

          expected: `#{inspect @csv_parsed}`, got: `#{inspect other}`
          """}
      end
    end)
  end

  verify "different separator" do
    content = String.replace(@csv, ",", " ")
    with_tmp_file(content, fn file ->
      case Csv.parse(file, separator: " ", header: false) do
        @csv_parsed ->
          :ok
        other ->
          {:error, """
          When parsing:

          #{@csv}

          expected: `#{inspect @csv_parsed}`, got: `#{inspect other}`
          """}
      end
    end)
  end

  verify "with header" do
    with_tmp_file(@csv, fn file ->
      case Csv.parse(file, header: true) do
        @csv_parsed_header ->
          :ok
        other ->
          {:error, """
          When parsing:

          #{@csv}

          expected: `#{inspect @csv_parsed_header}`, got: `#{inspect other}`
          """}
      end
    end)
  end
end
