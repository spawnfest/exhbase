defmodule ExHBaseTest do
  use ExUnit.Case
  doctest ExHBase

  test "greets the world" do
    assert ExHBase.hello() == :world
  end
end
