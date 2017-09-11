defmodule NucleotideCount do
  @moduledoc """
  Solution for [Nucleotide Count](http://exercism.io/exercises/elixir/nucleotide-count/readme) exercise.
  """

  @doc ~S"""
  Count the number occurrences of a specified `nucleotide` in `dna_string`.

  ## Examples

      iex> NucleotideCount.count("", "A")
      0

      iex> NucleotideCount.count("CCCCC", "C")
      5

      iex> NucleotideCount.count("GGGGGTAACCCGG", "T")
      1
  """
  def count(dna_string, nucleotide) do
    dna_string
    |> String.codepoints
    |> Enum.count(fn(x) -> x == nucleotide end)
  end

  @doc ~S"""
  Count the number of occurrences of all nucleotides in `dna_string`.

  ## Examples

      iex> NucleotideCount.histogram("")
      %{A => 0, T => 0, C => 0, G => 0}

      iex> NucleotideCount.histogram("GGGGGGGG")
      %{A => 0, T => 0, C => 0, G => 8}

      iex> NucleotideCount.histogram("AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC")
      %{A => 20, T => 21, C => 12, G => 17}
  """
  def histogram(dna_string) do
    dna_string
    |> String.codepoints
    |> Enum.reduce(%{A => 0, T => 0, C => 0, G => 0}, fn(x, acc) ->
      case x do
        "A" -> Map.update(acc, A, 0, fn(value) -> value + 1 end)
        "T" -> Map.update(acc, T, 0, fn(value) -> value + 1 end)
        "C" -> Map.update(acc, C, 0, fn(value) -> value + 1 end)
        "G" -> Map.update(acc, G, 0, fn(value) -> value + 1 end)
      end
    end)
  end
end
