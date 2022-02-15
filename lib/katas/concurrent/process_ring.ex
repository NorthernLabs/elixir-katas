defmodule ElixirKatas.Concurrent.ProcessRing do
  @moduledoc """
  Concurrent programming katas.

  Make use of [processes](https://elixir-lang.org/getting-started/processes.html) to solve these excercises.
  """

  @doc """
  This function should create `n` processes in a ring, so that a message sent to the first process
  gets sent around the ring to the last (nth) process.

  When a processes in the ring receives the `:stop` message it should forward the message and exit normally.

  Returns the `pid()` of the first process in the ring.
  """
  def ring(n) do
    Enum.reduce(1..n, :last, fn
      _i, :last -> spawn(fn -> loop(:last) end)
      _i, next -> spawn(fn -> loop(next) end)
    end)
  end

  defp loop(:last) do
    receive do
      :stop -> exit(:normal)
      _msg -> loop(:last)
    end
  end

  defp loop(next) do
    receive do
      :stop ->
        send(next, :stop)

      msg ->
        send(next, msg)
        loop(next)
    end
  end
end
