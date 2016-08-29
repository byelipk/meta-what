defmodule Mod do

  defmacro definfo do
    IO.puts "In macro's context (#{__MODULE__})"

    quote do
      def friendly_info do
        IO.puts """
        My name is #{__MODULE__}
        My functions are #{inspect __info__(:functions)}
        """
      end
    end
  end
  
end
