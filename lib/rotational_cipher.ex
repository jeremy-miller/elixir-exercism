defmodule RotationalCipher do
  @moduledoc """
  Solution for [Rotational Cipher](http://exercism.io/exercises/elixir/rotational-cipher/readme) exercise.
  """

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
    
  end
end
