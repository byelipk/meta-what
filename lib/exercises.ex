defmodule Exercises do
  import Loop

  def spawn_pid do
    spawn fn ->
      while true do
        receive do
          :stop   -> IO.puts "Stopping..."; break
          message -> IO.puts "Got message: #{message}"
        end
      end
    end
  end

end
