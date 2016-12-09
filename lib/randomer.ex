defmodule Constrictor.Randomer do

  @chars "ABCDEFGHIJKLMNOPQRSTUVWXYZ" |> String.split("", trim: true)
  @numbers "0123456789" |> String.split("", trim: true)


  def start(string) do
    string
      |> String.split
      |> convertToAtom
      |> IO.inspect
      |> convertToInt
      |> IO.inspect
      |> List.to_tuple
      |> generateRandomValue
  end

  defp convertToAtom([h|t]) do
    [String.to_atom(h)|t]
  end

  defp convertToInt([h|[tailHead | _t]]) do
    [h, String.to_integer(tailHead)]
  end

  defp generateRandomValue({:alphanumeric, length} = options) when is_integer length do
    Enum.reduce((1..length), [], fn (i, acc) ->
          case rem(i,2) do
            0 -> [Enum.random(@chars) | acc]
            1 -> [Enum.random(@numbers) | acc]
          end
        end)
  end

  defp generateRandomValue({:numbers, length} = options) when is_integer length do
    Enum.reduce((1..length), [], fn (i, acc) ->
             [Enum.random(@numbers) | acc]
        end) |> Enum.join("")
    end

  defp generateRandomValue({:chars, length} = options) when is_integer length do
    Enum.reduce((1..length), [], fn (i, acc) ->
             [Enum.random(@chars) | acc]
        end) |> Enum.join("")
  end

  defp generateRandomValue({:pattern, pattern} = options) do
      :pattern
  end

  defp generateRandomValue({:uuid, _} = options) do
      UUID.uuid1()
  end

  defp generateRandomValue({s, length} = options) do
options
  end

end
