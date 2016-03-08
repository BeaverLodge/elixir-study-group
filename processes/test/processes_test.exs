defmodule ProcessesTest do
  use ExUnit.Case
  doctest Processes

  test "Sending greeter a message" do
    greeter_pid = Processes.greeter
    send greeter_pid, {self, "World"}

    assert_receive {:ok, "Hello, World"}

    send greeter_pid, {self, "Dave!"}

    assert_receive {:ok, "Hello, Dave!"}
  end

  @tag :skip
  test "Counting the number of requests" do
    count_greet = Processes.count_greeter

    send count_greet, {self, "World!"}

    assert_receive {:ok, "Hello, World! count: 1"}

    send count_greet, {self, "World!"}

    assert_receive {:ok, "Hello, World! count: 2"}
  end

end
