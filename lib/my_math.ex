defmodule MyMath do
  @doc """
  A macro for reporting the details of an addition
  operation in English.

  It recieves an AST as an input value and returns
  an AST as an output value.

  ## Examples

  ```
  MyMath.say 1 + 1
  ```
  """
  defmacro say({:+, _, [lhs, rhs]}) do
    quote do
      lhs = unquote(lhs)
      rhs = unquote(rhs)
      result = lhs + rhs
      IO.puts "#{lhs} plus #{rhs} is #{result}"
      result
    end
  end

  @doc """
  A macro for reporting the details of a multiplication
  operation in English.

  It recieves an AST as an input value and returns
  an AST as an output value.

  ## Examples

  ```
  MyMath.say 1 * 1
  ```
  """
  defmacro say({:*, _, [lhs, rhs]}) do
    quote do
      lhs = unquote(lhs)
      rhs = unquote(rhs)
      result = lhs * rhs
      IO.puts "#{lhs} times #{rhs} is #{result}"
      result
    end
  end
end
