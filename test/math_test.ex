defmodule MyMathTest do
  use ExUnit.Case
  doctest MyMath

  test "It can perform addition of two integers" do
    result = MyMath.say(1 + 1)
    assert result == 2
  end

  test "It can perform multiplication of two integers" do
    result = MyMath.say(9 * 10)
    assert result == 90
  end
end
