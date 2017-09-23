defmodule Strain do
  @moduledoc """
  Solution for [Strain](http://exercism.io/exercises/elixir/strain/readme) exercise.
  """

  import Enum, only: [reduce: 3]

  @doc ~S"""
  Given a `collection` and a `function`, returns a new collection containing those elements where the
  `function` is true.

  ## Examples

      iex> require Integer
      iex> Strain.keep([1, 2, 3], &Integer.is_odd/1)
      [1, 3]
      iex> Strain.keep([1, 2, 3, 4, 5], &Integer.is_even/1)
      [2, 4]
  """
  @spec keep(list, (any() -> true | false)) :: list
  def keep(collection, function) do
    reduce(collection, [], fn(x, acc) -> if function.(x), do: acc ++ [x], else: acc end)
  end

  @doc ~S"""
  Given a `collection` and a `function`, returns a new collection containing those elements where the
  `function` is false.

  ## Examples

      iex> require Integer
      iex> Strain.discard([1, 2, 3], &Integer.is_odd/1)
      [2]
      iex> Strain.discard([1, 2, 3, 4, 5], &Integer.is_even/1)
      [1, 3, 5]
  """
  @spec discard(list, (any() -> true | false)) :: list
  def discard(collection, function) do
    reduce(collection, [], fn(x, acc) -> if function.(x), do: acc, else: acc ++ [x] end)
  end
end
