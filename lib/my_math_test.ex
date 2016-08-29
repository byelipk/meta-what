defmodule MyMathTest do
  import Assertion

  def run do
    assert 5 == 5
    assert 1 > 0
    assert 10 * 10 == 100
    assert 5 < 10
    assert 1 > 3
  end

end
