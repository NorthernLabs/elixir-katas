defmodule ElixirKatas.Concurrent.ParallelMap do
  @moduledoc """
  Concurrent programming katas.

  Make use of [processes](https://elixir-lang.org/getting-started/processes.html) to solve these excercises.
  """

  @doc """
  Performs a parallel map. Similar to `Enum.map/2` but each function application is done concurrently.

  ## Examples

    iex> pmap([1, 2, 3, 4, 5], fn el -> el * 10 end)
    [10, 20, 30, 40, 50]

  """
  def pmap(list, f) do
    :answer
  end
end
