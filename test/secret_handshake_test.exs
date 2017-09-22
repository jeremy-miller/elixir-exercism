defmodule SecretHandshakeTest do
  use ExUnit.Case, async: true
  use Quixir
  import Enum, only: [all?: 2]
  doctest SecretHandshake

  describe "SecretHandshake.commands/1" do
    test "jump for 1000" do
      assert SecretHandshake.commands(8) === ["jump"]
    end

    test "combine two actions" do
      assert SecretHandshake.commands(3) === ["wink", "double blink"]
    end

    test "reverse two actions" do
      assert SecretHandshake.commands(19) === ["double blink", "wink"]
    end

    test "reversing one action gives the same action" do
      assert SecretHandshake.commands(24) === ["jump"]
    end

    test "reversing no actions still gives no actions" do
      assert SecretHandshake.commands(16) === []
    end

    test "all possible actions" do
      assert SecretHandshake.commands(15) === ["wink", "double blink", "close your eyes", "jump"]
    end

    test "reverse all possible actions" do
      assert SecretHandshake.commands(31) === ["jump", "close your eyes", "double blink", "wink"]
    end

    test "do nothing for zero" do
      assert SecretHandshake.commands(0) === []
    end

    test "do nothing if lower 5 bits not set" do
      assert SecretHandshake.commands(32) === []
    end

    test "SecretHandshake.commands correctly returns no commands if lower 5 bits are not set" do
      ptest number: int(min: 32) do
        assert SecretHandshake.commands(number) === []
      end
    end
    
    test "SecretHandshake.commands correctly returns commands" do
      ptest number: int(min: 0, max: 31) do
        actions = SecretHandshake.commands(number)
        assert length(actions) >= 0
        assert length(actions) <= 4
        assert all?(actions, &(&1 in ["wink", "double blink", "close your eyes", "jump"]))
      end
    end
  end
end
