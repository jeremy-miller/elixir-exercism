defmodule StrainTest do
  use ExUnit.Case, async: true
  use Quixir
  doctest Strain

  defp noop(_), do: true

  describe "Strain.keep/2" do
    test "empty keep" do
      assert Strain.keep([], &noop/1) == []
    end

    test "keep everything" do
      assert Strain.keep([1, 2, 3], fn e -> e < 10 end) == [1, 2, 3]
    end
  
    test "keep strings" do
      words = ~w(apple zebra banana zombies cherimoya zelot)
      assert Strain.keep(words, &(String.starts_with?(&1, "z"))) == ~w(zebra zombies zelot)
    end
  
    test "keep arrays" do
      rows = [
        [1, 2, 3],
        [5, 5, 5],
        [5, 1, 2],
        [2, 1, 2],
        [1, 5, 2],
        [2, 2, 1],
        [1, 2, 5]
      ]
  
      assert Strain.keep(rows, fn row -> 5 in row end) == [[5, 5, 5], [5, 1, 2], [1, 5, 2], [1, 2, 5]]
    end
  end

  describe "Strain.discard/2" do
    test "empty discard" do
      assert Strain.discard([], &noop/1) == []
    end

    test "discard nothing" do
      assert Strain.discard([1, 2, 3], fn e -> e > 10 end) == [1, 2, 3]
    end
  
    test "discard strings" do
      words = ~w(apple zebra banana zombies cherimoya zelot)
      assert Strain.discard(words, &(String.starts_with?(&1, "z"))) == ~w(apple banana cherimoya)
    end
  
    test "discard arrays" do
      rows = [
        [1, 2, 3],
        [5, 5, 5],
        [5, 1, 2],
        [2, 1, 2],
        [1, 5, 2],
        [2, 2, 1],
        [1, 2, 5]
      ]
      assert Strain.discard(rows, fn row -> 5 in row end) == [[1, 2, 3], [2, 1, 2], [2, 2, 1]]
    end
  end
end
