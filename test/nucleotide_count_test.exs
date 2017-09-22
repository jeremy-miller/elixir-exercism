defmodule NucleotideCountTest do
  use ExUnit.Case, async: true
  use Quixir
  import Map, only: [has_key?: 2, keys: 1]
  doctest NucleotideCount

  test "NucleotideCount.count correctly counts valid nucleotides" do
    ptest dna_string: string(chars: :upper, must_have: ["A", "T", "C", "G"]), nucleotide: string(min: 1, max: 1, chars: :upper, must_have: ["A", "T", "C", "G"]) do
      assert NucleotideCount.count(dna_string, nucleotide) >= 0
    end
  end

  test "NucleotideCount.count correctly counts nucleotides with invalid input" do
    ptest dna_string: string(chars: :upper), nucleotide: string(min: 1, max: 1, chars: :upper, must_have: ["A", "T", "C", "G"]) do
      assert NucleotideCount.count(dna_string, nucleotide) >= 0
    end
  end

  test "NucleotideCount.histogram correctly counts valid nucleotides" do
    ptest dna_string: string(chars: :upper, must_have: ["A", "T", "C", "G"]) do
      histogram = NucleotideCount.histogram(dna_string)
      histogram_keys_length = keys(histogram) |> length
      assert histogram_keys_length === 4
      assert has_key?(histogram, A)
      assert has_key?(histogram, T)
      assert has_key?(histogram, C)
      assert has_key?(histogram, G)
      assert histogram[A] >= 0
      assert histogram[T] >= 0
      assert histogram[C] >= 0
      assert histogram[G] >= 0
    end
  end

  test "NucleotideCount.histogram correctly counts nucleotides with invalid input" do
    ptest dna_string: string(chars: :upper) do
      histogram = NucleotideCount.histogram(dna_string)
      histogram_keys_length = keys(histogram) |> length
      assert histogram_keys_length === 4
      assert has_key?(histogram, A)
      assert has_key?(histogram, T)
      assert has_key?(histogram, C)
      assert has_key?(histogram, G)
      assert histogram[A] >= 0
      assert histogram[T] >= 0
      assert histogram[C] >= 0
      assert histogram[G] >= 0
    end
  end
end
