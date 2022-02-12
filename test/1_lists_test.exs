defmodule ElixirKatas.ListsTests do
  use ExUnit.Case, async: false

  alias ElixirKatas.Lists

  describe "reverse/1" do
    test "reversing the empty list returns empty list" do
      assert Lists.reverse([]) == []
    end

    test "reversing a list of all duplicated elements returns the same list" do
      all_ones = [1, 1, 1, 1, 1]
      assert Lists.reverse(all_ones) == all_ones
    end

    test "reverse/1 produces the same result as `Enum.reverse/1`" do
      list = [:a, 5, :b, 6, "asfdasf"]
      assert Lists.reverse(list) == Enum.reverse(list)
    end
  end

  describe "remove_consecutive_duplicates/1" do
    test "the empty list returns empty list" do
      assert Lists.remove_consecutive_duplicates([]) == []
    end

    test "a list of all duplicated elements returns a list of one element" do
      all_ones = [1, 1, 1, 1, 1]
      assert Lists.remove_consecutive_duplicates(all_ones) == [1]
    end

    test "a list of unique elements returns itself" do
      list = [:a, 5, :b, 6, "asfdasf"]
      assert Lists.remove_consecutive_duplicates(list) == list
    end
  end
end
