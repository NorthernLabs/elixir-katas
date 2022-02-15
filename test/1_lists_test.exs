defmodule ElixirKatas.ListsTests do
  use ExUnit.Case, async: false
  @moduletag :lists

  alias ElixirKatas.Lists

  @all_ones [1, 1, 1, 1, 1]
  @all_twos [2, 2, 2, 2, 2, 2]
  @all_atoms ~w(a b c d e)a
  @one_to_five [1, 2, 3, 4, 5]

  describe "reverse/1" do
    @describetag mfa: {Lists, :reverse, 1}

    test "reversing the empty list returns empty list" do
      assert Lists.reverse([]) == []
    end

    test "reversing a list of all duplicated elements returns the same list" do
      assert Lists.reverse(@all_ones) == @all_ones
    end

    test "reverse/1 produces the same result as `Enum.reverse/1`" do
      list = [:a, 5, :b, 6, "asfdasf"]
      assert Lists.reverse(list) == Enum.reverse(list)
    end
  end

  describe "remove_consecutive_duplicates/1" do
    @describetag mfa: {Lists, :remove_consecutive_duplicates, 1}

    test "the empty list returns empty list" do
      assert Lists.remove_consecutive_duplicates([]) == []
    end

    test "a list of all duplicated elements returns a list of one element" do
      assert Lists.remove_consecutive_duplicates(@all_ones) == [1]
    end

    test "a list of unique elements returns itself" do
      list = [:a, 5, :b, 6, "asfdasf"]
      assert Lists.remove_consecutive_duplicates(list) == list
    end
  end

  describe "foldl/2" do
    @describetag mfa: {Lists, :foldl, 2}

    test "constant function returns constant" do
      assert Lists.foldl(@one_to_five, fn _, _ -> 5 end) == 5
    end

    test "correctly sums all numbers" do
      assert Lists.foldl(@one_to_five, &Kernel.+/2) == Enum.sum(@one_to_five)
    end

    test "correctly multiplies all numbers" do
      assert Lists.foldl(@one_to_five, &Kernel.*/2) == Enum.product(@one_to_five)
    end
  end

  describe "rotate/2" do
    @describetag mfa: {Lists, :rotate, 2}

    test "rotate 0 places returns the same list" do
      assert Lists.rotate(@one_to_five, 0) == @one_to_five
    end

    test "rotate length(list) returns the same list" do
      assert Lists.rotate(@one_to_five, length(@one_to_five)) == @one_to_five
    end

    test "the empty list returns empty list" do
      assert Lists.remove_consecutive_duplicates([]) == []
    end

    test "correctly rotates 1 place to the left" do
      assert Lists.rotate(@one_to_five, -1) == [2, 3, 4, 5, 1]
    end

    test "correctly rotates 3 place to the left" do
      assert Lists.rotate(@one_to_five, -3) == [4, 5, 1, 2, 3]
    end

    test "correctly rotates 1 place to the right" do
      assert Lists.rotate(@one_to_five, 1) == [5, 1, 2, 3, 4]
    end
  end

  describe "rle/1" do
    @describetag mfa: {Lists, :rle, 1}

    test "correctly returns the run-length-encoding for a list of unique elements" do
      assert Lists.rle(@one_to_five) == Enum.map(@one_to_five, fn el -> {1, el} end)
    end

    test "correctly returns the run-length-encoding for the doctest list" do
      assert Lists.rle([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e]) == [
               {4, :a},
               {1, :b},
               {2, :c},
               {2, :a},
               {1, :d},
               {4, :e}
             ]
    end

    test "a list of all duplicated elements returns the same list" do
      assert Lists.rle([]) == []
    end

    test "correctly returns the run-length-encoding for a list of all duplicated elements" do
      assert Lists.rle(@all_ones) == [{length(@all_ones), 1}]
    end
  end

  describe "all?/2" do
    @describetag mfa: {Lists, :all?, 2}

    test "the empty list returns true" do
      assert Lists.all?([], &even?/1)
    end

    test "list of ones does not contain even numbers" do
      refute Lists.all?(@all_ones, &even?/1)
    end

    test "list of all twos is made up of all even numbers" do
      assert Lists.all?(@all_twos, &even?/1)
    end

    test "returns the same as `Enum.all?`" do
      assert Lists.all?(@all_atoms, &is_atom/1) == Enum.all?(@all_atoms, &is_atom/1)
    end
  end

  describe "filter?/2" do
    @describetag mfa: {Lists, :filter?, 2}

    test "the empty list returns true" do
      assert Lists.filter([], &even?/1)
    end

    test "list of ones filtered with `even?/1` returns the empty list" do
      assert Lists.filter(@all_ones, &even?/1) == []
    end

    test "list of all twos filtered with `even?/1` returns the same list" do
      assert Lists.filter(@all_twos, &even?/1) == @all_twos
    end

    test "returns the same as `Enum.filter/2`" do
      list = [1, 2, 6, 12, 41]
      assert Lists.filter(list, &even?/1) == Enum.filter(list, &even?/1)
    end
  end

  defp even?(n), do: rem(n, 2) == 0
end
