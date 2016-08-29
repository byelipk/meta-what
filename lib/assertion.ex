defmodule Assertion do

  # NOTE
  # __using__ is part of Elixir's public API for extending modules.
  defmacro __using__(_options) do
    quote do
      import unquote(__MODULE__)

      # We need a way to keep track of all the test-case
      # definitions registered by the user.
      #
      # The `accumulate: true` option allows us to keep an
      # appended list of registrations during the compile phase.
      #
      # We can access this list inside other macros we define
      # by calling @tests
      Module.register_attribute __MODULE__, :tests, accumulate: true

      @before_compile unquote(__MODULE__)
    end
  end

  defmacro __before_compile__(_env) do
    quote do
      def run, do: Assertion.Test.run(@tests, __MODULE__)
    end
  end

  defmacro test(desc, do: test_block) do
    test_name = desc
            |> String.downcase
            |> String.replace(~r/[^a-zA-Z0-9]/, "_")
            |> String.to_atom

    quote do
      # Append meta data about our test to the module attribute
      @tests { unquote(test_name), unquote(desc) }

      # Define and invoke the test function
      def unquote(test_name)(), do: unquote(test_block)
    end
  end

  defmacro assert({operator, _, [lhs, rhs]}) do
    quote bind_quoted: [operator: operator, lhs: lhs, rhs: rhs] do
      Assertion.Test.assert(operator, lhs, rhs)
    end
  end

end

defmodule Assertion.Test do

  def run(tests, module) do
    Enum.each tests, fn {test_func, desc} ->
      case apply(module, test_func, []) do
        :ok             -> IO.write(".")
        {:fail, reason} -> IO.puts """
        ===============================================
        FAILURE: #{desc}
        ===============================================
        #{reason}
        """
      end
    end
  end

  def assert(:==, lhs, rhs) when lhs == rhs, do: :ok
  def assert(:==, lhs, rhs) do
    {:fail, """
      Expected:  #{lhs}
      to equal:  #{rhs}
      """
    }
  end

  def assert(:>, lhs, rhs) when lhs > rhs, do: :ok
  def assert(:>, lhs, rhs) do
    {:fail, """
      Expected:            #{lhs}
      to be greater than:  #{rhs}
      """
    }
  end

  def assert(:<, lhs, rhs) when lhs < rhs, do: :ok
  def assert(:<, lhs, rhs) do
    {:fail, """
      Expected:            #{lhs}
      to be less than:  #{rhs}
      """
    }
  end
end
