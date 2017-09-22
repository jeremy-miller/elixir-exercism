defmodule RotationalCipher do
  @moduledoc """
  Solution for [Rotational Cipher](http://exercism.io/exercises/elixir/rotational-cipher/readme) exercise.
  """

  import Enum, only: [at: 2, find_index: 2, join: 2, map: 2]
  import Integer, only: [mod: 2]
  import String, only: [codepoints: 1]

  @lowercase_alphabet ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p",
  "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
  @uppercase_alphabet ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P",
  "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

  @doc ~S"""
  Shifts all letters in the `plaintext` by the same amount and returns the shifted ciphertext.
  Letters are shifted for as many values as the value of `key`.
  This cipher is also known as the Caesar cipher.

  ## Examples

      iex> RotationalCipher.rotate("a", 1)
      "b"
      
      iex> RotationalCipher.rotate("a", 2)
      "c"
  """
  @spec rotate(String.t, integer) :: String.t
  def rotate(plaintext, key) do
    plaintext
    |> codepoints
    |> map(fn(character) ->
         cond do
           character in @lowercase_alphabet -> lookup_character(character, @lowercase_alphabet, key)
           character in @uppercase_alphabet -> lookup_character(character, @uppercase_alphabet, key)
           true -> character
         end
       end)
    |> join("")
  end

  defp lookup_character(character, alphabet, key) do
    alphabet
    |> find_index(fn(letter) -> letter === character end)
    |> (&(mod(&1 + key, 26))).()
    |> (&(at(alphabet, &1))).()
  end
end
