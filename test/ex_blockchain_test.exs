defmodule ExBlockchainTest do
  use ExUnit.Case
  doctest ExBlockchain

  test "greets the world" do
    assert ExBlockchain.hello() == :world
  end
end
