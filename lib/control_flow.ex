defmodule ControlFlow do

  defmacro unless(expression, do: block) do
    quote do
      # if !unquote(expression), do: unquote(block)
      case unquote(expression) do
        false    -> unquote(block)
        nil      -> unquote(block)
        _truthy  -> false
      end
    end
  end

  defmacro my_if(expr, do: if_block), do: if(expr, do: if_block, else: nil)
  defmacro my_if(expr, do: if_block, else: else_block) do
    quote do
      case unquote(expr) do
        result when result in [false, nil] -> unquote(else_block)
                                   _truthy -> unquote(if_block)
      end
    end
  end

end
