defmodule ElixirKatas.Lists do
  @moduledoc """
  List katas.
  To be solved using pattern matching and [tail recursive](https://en.wikipedia.org/wiki/Tail_call) functions.

  **Do not** use the functions in `Enum` or `Lists`.
  """

  @doc """
  Reverses a list.

  ## Examples

    iex> reverse([1, 2, 3])
    [3, 2, 1]

    iex> reverse([])
    []

  """
  def reverse(list) do
    :answer
  end

  @doc """
  Removes repeated _consecutive_ values in a list.

  ## Examples

    iex> remove_consecutive_duplicates([1, 1, 2, 3, 2])
    [1, 2, 3, 2]

    iex> remove_consecutive_duplicates([5, 5, 5, 5])
    [5]

  """
  def remove_consecutive_duplicates(list) do
    :answer
  end

  @doc """
  Takes a list and a 2-arity function and performs a [fold left](https://en.wikipedia.org/wiki/Fold_(higher-order_function)).
  The function takes an element of the list and an accumulator, in that order.
  Assume `length(list) >= 2`.

  ## Examples

    iex> foldl([1, 2, 3, 2], fn a, b -> a + b end)
    8

    iex> foldl([1], fn a, b -> a * b end)
    1

  """
  def foldl(list, f) do
    :answer
  end

  @doc """
  Rotates a list `n` places to the right when `n` is positive, to the left otherwise.

  ## Examples

    iex> rotate([1, 2, 3, 4, 5], 2)
    [4,5,1,2,3]

    iex> rotate([1, 2, 3, 4, 5], -1)
    [2, 3, 4, 5, 1]

  """
  def rotate(list, n) do
    :answer
  end

  @doc """
  Performs [run-length encoding](https://en.wikipedia.org/wiki/Run-length_encoding) on a list.
  It returns a list of tuples `{n, el}` where `n` is the count of consecutive `el`s in the list.

  ## Examples

    iex> rle([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e])
    [{4, :a}, {1, :b}, {2, :c}, {2, :a}, {1, :d}, {4, :e}]

  """
  def rle(list) do
    :answer
  end

  @doc """
  Returns `true` if all the elements in the list satisfy the predicate (a function that returns a boolean) `pred`.
  Returns `false` otherwise.

  ## Examples

    iex> all?([1, 2, -5], fn el -> el > 0 end)
    false

    iex> all?([10], fn el -> el > 0 end)
    true

  """
  def all?(list, pred) do
    :answer
  end

  @doc """
  Returns all the elements in the given list that satisfy the predicate `pred`.

  ## Examples

    iex> filter([1, 2, 6, 12, 41], fn el -> rem(el, 2) == 0 end)
    [2, 6, 12]

    iex> filter([10, -5], fn el -> el > 0 end)
    [10]

  """
  def filter(list, pred) do
    :answer
  end
end
