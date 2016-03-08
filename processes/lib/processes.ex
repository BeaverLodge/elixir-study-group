defmodule Processes do
  @module """
  This module is to demonstrate the use of processes in Elixir / Erlang.

  Implement the necessary functions to make the tests pass.

  The greeter is provided as an example to get things going.
  """

  @doc """
  greeter returns a process id (PID)

  iex> pid = Processes.greeter
  iex> is_pid(pid)
  true
  """
  def greeter do
    spawn(Processes, :greet, [])
  end


  @doc """
  greet responds to messages with Hello + name

  This function recursively invokes itself to remain alive.
  """
  def greet do
    receive do
      {sender, msg} ->
        send sender, {:ok, "Hello"}
        greet
    end
  end
end
