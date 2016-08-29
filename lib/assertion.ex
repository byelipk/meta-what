defmodule Assertion do

  defmacro assert({operator, _, [lhs, rhs]}) do
    quote bind_quoted: [operator: operator, lhs: lhs, rhs: rhs] do
      Assertion.Test.assert(operator, lhs, rhs)
    end
  end

  # NOTE
  # __using__ is part of Elixir's public API for extending modules.
  defmacro __using__(_options) do
    quote do
      import unquote(__MODULE__)

      # After importing the current module, any functions
      # we define will be available on the module.
      def run do
        IO.puts "Running the tests..."
      end
    end
  end

end

defmodule Assertion.Test do

  def assert(:==, lhs, rhs) when lhs == rhs, do: IO.write(".")
  def assert(:==, lhs, rhs) do
    IO.puts """
    FAILURE:
      Expected:        #{lhs}
      to be equal to:  #{rhs}
    """
  end

  def assert(:>, lhs, rhs) when lhs > rhs, do: IO.write(".")
  def assert(:>, lhs, rhs) do
    IO.puts """
    FAILURE:
      Expected:            #{lhs}
      to be greater than:  #{rhs}
    """
  end

  def assert(:<, lhs, rhs) when lhs < rhs, do: IO.write(".")
  def assert(:<, lhs, rhs) do
    IO.puts """
    FAILURE:
      Expected:            #{lhs}
      to be less than:  #{rhs}
    """
  end
end
