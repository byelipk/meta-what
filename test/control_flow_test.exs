defmodule ControlFlowTest do
  use ExUnit.Case
  doctest ControlFlow

  test "unless keyword runs block when test condition fails" do
    result = ControlFlow.unless(1 == 2, do: "block entered")
    assert result == "block entered"
  end

  test "unless keyword skips block when test condition passes" do
    result = ControlFlow.unless(1 == 1, do: "block entered")
    assert result != "block entered"
  end

end
