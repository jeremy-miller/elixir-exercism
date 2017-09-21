defmodule SecretHandshake do
  @moduledoc """
  Solution for [Secret Handshake](http://exercism.io/exercises/elixir/secret-handshake/readme) exercise.
  """

  use Bitwise, only_operators: true

  import Enum, only: [reduce: 3, reverse: 1]

  @available_actions [
    {1000, "jump"},
    {100, "close your eyes"},
    {10, "double blink"},
    {1, "wink"}
  ]

  @doc ~S"""
  Convert a decimal `number` to the correct sequence of actions for a secret handshake.

  Binary conversion chart:
  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump
  10000 = reverse the order of the operations in the secret handshake

  ## Examples

      iex> SecretHandshake.commands(1)
      ["wink"]
      iex> SecretHandshake.commands(2)
      ["double blink"]
      iex> SecretHandshake.commands(4)
      ["close your eyes"]
  """
  @spec commands(integer) :: [String.t]
  def commands(number) do
    # credo:disable-for-next-line
    reverse_value = number &&& 10000
    actions = get_actions(reverse_value, number)
    if reverse_value > 0 do
      reverse(actions)
    else
      actions
    end
  end

  @spec get_actions(integer, integer) :: [String.t]
  defp get_actions(reverse_value, number) do
    if number < 32 do  # nothing to do if lower 5 bits are empty (32 = 100000)
      {_, actions} =
        @available_actions
        |> reduce({number - reverse_value, []},
                  fn({bitmask, action}, {new_number, actions_acc}) ->
                    value = new_number &&& bitmask
                    if value > 0 do
                      {new_number - value, [action | actions_acc]}
                    else
                      {new_number, actions_acc}
                    end
                  end)
      actions
    else
      []
    end
  end
end
