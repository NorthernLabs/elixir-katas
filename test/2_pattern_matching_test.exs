defmodule ElixirKatas.PatternMatchingTest do
  use ExUnit.Case, async: false
  @moduletag :pattern_matching

  alias ElixirKatas.PatternMatching

  describe "bmi_classification/1" do
    @describetag mfa: {PatternMatching, :bmi_classification, 2}

    test "correctly classifies underweight bmi" do
      assert PatternMatching.bmi_classification(45, 1.68) == :underweight
    end

    test "correctly classifies normal bmi" do
      assert PatternMatching.bmi_classification(60, 1.60) == :normal
    end

    test "correctly classifies overweight bmi" do
      assert PatternMatching.bmi_classification(70, 1.55) == :overweight
    end

    test "correctly classifies obese bmi" do
      assert PatternMatching.bmi_classification(120, 1.89) == :obese
    end
  end

  describe "rgb/3" do
    @describetag mfa: {PatternMatching, :rgb, 3}

    test "correctly encodes black" do
      assert PatternMatching.rgb(0, 0, 0) == "000000"
    end

    test "correctly encodes white" do
      assert PatternMatching.rgb(255, 255, 255) == "FFFFFF"
    end

    test "correctly encodes crimson" do
      assert PatternMatching.rgb(220, 20, 60) == "DC143C"
    end
  end

  describe "isogram?/1" do
    @describetag mfa: {PatternMatching, :isogram?, 1}

    test "empty string is an isogram" do
      assert PatternMatching.isogram?("")
    end

    test "single letter string is an isogram" do
      assert PatternMatching.isogram?("x")
    end

    test "'lumberjack' is an isogram" do
      assert PatternMatching.isogram?("lumberjack")
    end

    test "'isograms' is not an isogram" do
      refute PatternMatching.isogram?("isograms")
    end

    test "'downstream' is an isogram" do
      assert PatternMatching.isogram?("downstream")
    end
  end

  describe "roman_numeral/1" do
    @describetag mfa: {PatternMatching, :roman_numeral, 1}

    test "3" do
      assert PatternMatching.roman_numeral(3) == "III"
    end

    test "6" do
      assert PatternMatching.roman_numeral(6) == "VI"
    end

    test "9" do
      assert PatternMatching.roman_numeral(9) == "IX"
    end

    test "27" do
      assert PatternMatching.roman_numeral(27) == "XXVII"
    end

    test "48" do
      assert PatternMatching.roman_numeral(48) == "XLVIII"
    end

    test "59" do
      assert PatternMatching.roman_numeral(59) == "LIX"
    end

    test "93" do
      assert PatternMatching.roman_numeral(93) == "XCIII"
    end

    test "141" do
      assert PatternMatching.roman_numeral(141) == "CXLI"
    end

    test "163" do
      assert PatternMatching.roman_numeral(163) == "CLXIII"
    end

    test "402" do
      assert PatternMatching.roman_numeral(402) == "CDII"
    end

    test "575" do
      assert PatternMatching.roman_numeral(575) == "DLXXV"
    end
  end

  describe "collatz/1" do
    @describetag mfa: {PatternMatching, :collatz, 1}

    test "zero steps for one" do
      assert PatternMatching.collatz(1) == 0
    end

    test "4 steps for 16" do
      assert PatternMatching.collatz(16) == 4
    end

    test "9 steps for 12" do
      assert PatternMatching.collatz(12) == 9
    end

    test "152 steps for 1_000_000" do
      assert PatternMatching.collatz(1_000_000) == 152
    end

    test "7 steps for 21" do
      assert PatternMatching.collatz(21) == 7
    end

    test "16 steps for 7" do
      assert PatternMatching.collatz(7) == 16
    end
  end
end
