defmodule ElixirKatas.Concurrent.ProcessRing do
  @moduledoc """
  Concurrent programming katas.

  Make use of [processes](https://elixir-lang.org/getting-started/processes.html) to solve these excercises.
  """

  @doc """
  This function should create `n` processes in a ring, so that a message sent to the first process
  gets sent around the ring to the last (nth) process.

  Returns the `pid()` of the first process in the ring.
  """
  def ring(n) do
    :answer
  end
end
