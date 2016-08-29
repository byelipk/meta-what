defmodule Setter do

  defmacro bind_name(string) do
    quote do
      IO.puts "I can override any bindings inside #{__MODULE__}"
      var!(name) = unquote(string)
    end
  end

end
