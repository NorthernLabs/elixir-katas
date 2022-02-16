defmodule ElixirKatas.ConcurrentTest do
  use ExUnit.Case, async: false
  @moduletag :concurrent

  alias ElixirKatas.Concurrent.{Calculator, ParallelMap, ProcessRing}

  describe "Calculator" do
    @describetag mfa: Calculator

    setup do
      server = Calculator.start()
      on_exit(fn -> Process.exit(server, :normal) end)

      %{server: server}
    end

    test "correctly starts a calculator server", %{server: server} do
      assert Process.alive?(server)
    end

    test "correctly stops a calculator server", %{server: server} do
      Calculator.stop(server)

      # ¯\_(ツ)_/¯
      Process.sleep(100)
      refute Process.alive?(server)
    end

    test "correctly adds two numbers", %{server: server} do
      assert Calculator.add(server, 66, 7) == 73
    end

    test "correctly subtracts two numbers", %{server: server} do
      assert Calculator.subtract(server, 33, 4) == 29
    end

    test "correctly multiplies two numbers", %{server: server} do
      assert Calculator.multiply(server, 34, 3) == 102
    end

    test "correctly divides two numbers", %{server: server} do
      assert Calculator.divide(server, 56, 2) == 28
    end
  end

  describe "ParallelMap" do
    @describetag mfa: {ParallelMap, :pmap, 2}

    @one_to_five [1, 2, 3, 4, 5]

    test "returns the same as `Enum.map/2`" do
      assert ParallelMap.pmap(@one_to_five, &double/1) == Enum.map(@one_to_five, &double/1)
    end

    test "pmap of the empty list returns the empty list" do
      assert ParallelMap.pmap([], &double/1) == []
    end

    test "constant function returns a list of constants" do
      assert ParallelMap.pmap(@one_to_five, fn _ -> 9 end) == [9, 9, 9, 9, 9]
    end

    defp double(n), do: 2 * n
  end

  describe "ProcessRing" do
    @describetag mfa: {ProcessRing, :ring, 1}
    @ring_size 10

    setup do
      init_state = %{process_count: 0, msg_count: 0, ret_pid: self()}
      :dbg.tracer(:process, {&trace_handler/2, init_state})
      :dbg.p(:new_processes, [:m, :p])

      on_exit(fn -> :dbg.stop_clear() end)
    end

    test "correctly starts and stops a 10 process ring" do
      ring_leader = ProcessRing.ring(@ring_size)
      assert Process.alive?(ring_leader)

      assert_receive {:ring_created, %{process_count: @ring_size}}, 5_000

      send(ring_leader, :hello)
      assert_receive {:msg_cycle, %{msg_count: @ring_size}}, 5_000

      send(ring_leader, :goodbye)
      assert_receive {:msg_cycle, %{msg_count: msg_count}}, 5_000
      assert msg_count == @ring_size * 2

      send(ring_leader, :stop)

      # ¯\_(ツ)_/¯
      Process.sleep(100)
      refute Process.alive?(ring_leader)
    end

    defp trace_handler(
           {_, _, :spawned, _, _},
           %{process_count: process_count, ret_pid: ret_pid} = state
         ) do
      state = %{state | process_count: process_count + 1}

      if @ring_size == process_count + 1 do
        send(ret_pid, {:ring_created, state})
      end

      state
    end

    defp trace_handler({_, _, :receive, _}, %{msg_count: msg_count} = state) do
      maybe_inform_state(%{state | msg_count: msg_count + 1})
    end

    defp trace_handler(_trace, state) do
      state
    end

    defp maybe_inform_state(%{msg_count: msg_count, ret_pid: ret_pid} = state)
         when msg_count > 0 and rem(msg_count, @ring_size) == 0 do
      send(ret_pid, {:msg_cycle, state})
      state
    end

    defp maybe_inform_state(state) do
      state
    end
  end
end
