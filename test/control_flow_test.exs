defmodule ControlFlowTest do
  use ExUnit.Case
  doctest ControlFlow

  test "unless runs block when test condition fails" do
    result = ControlFlow.unless(1 == 2, do: "block entered")
    assert result == "block entered"
  end

  test "unless skips block when test condition passes" do
    result = ControlFlow.unless(1 == 1, do: "block entered")
    assert result != "block entered"
  end

  test "my_if runs if_block when test condition is truthy" do
    result = ControlFlow.my_if(true, do: "block entered")
    assert result == "block entered"
  end

  test "my_if runs else_block when test condition is falsy" do
    result = ControlFlow.my_if(false, do: true, else: "block entered")
    assert result == "block entered"
  end

  test "my_if returns default value when else_block is not provided" do
    result = ControlFlow.my_if(false, do: true)
    assert result == nil
  end

end
