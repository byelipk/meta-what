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

end
