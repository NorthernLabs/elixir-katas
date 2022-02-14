defmodule ElixirKatas.PatternMatching do
  @moduledoc """
  Pattern matching katas.

  Feel free to write auxiliary functions if you need to.
  """

  @doc """
  Given a weight in kg and a height in meters, returns the [BMI classification](https://en.wikipedia.org/wiki/Body_mass_index) as follows:

  * `underweight`: when the BMI is < 18.5
  * `normal`: when the BMI is >= 18.5 and < 25
  * `overweight`: when the BMI is >= 25 and < 30
  * `obese`: when the BMI is >=- 30

  BMI is calculated as `weight / height ** 2`

  ## Examples

    iex> bmi_classification(60, 1.6)
    :normal

    iex> bmi_classification(150, 1.80)
    :obese

  """
  def bmi_classification(weight, height), do: bmi_category(weight / (height * height))

  defp bmi_category(bmi) when bmi < 18.5, do: :underweight
  defp bmi_category(bmi) when bmi < 25, do: :normal
  defp bmi_category(bmi) when bmi < 30, do: :overweight
  defp bmi_category(_bmi), do: :obese

  @doc """
  Receives RGB values in decimal and outputs a string with the hexadecimal representation.
  Assume the input values are between [0, 255]. The returned string should be of 6 characters long.

  ## Examples

    iex> rgb(255, 255, 255)
    "FFFFFF"

    iex> rgb(0, 0, 0)
    "000000"

  """
  def rgb(r, g, b) do
    for c <- [r, g, b], into: "" do
      c
      |> Integer.to_string(16)
      |> String.pad_leading(2, "0")
    end
  end

  @doc """
  Returns `true` if the given word is an isogram, `false` otherwise.
  An isogram (also known as a "nonpattern word") is a word or phrase without a repeating letter.

  ## Examples

    iex> isogram?("lumberjacks")
    true

    iex> isogram?("isograms")
    false

  """
  def isogram?(""), do: true
  def isogram?(<<_c::utf8>>), do: true

  def isogram?(<<c::utf8, rest::binary>>) do
    if String.contains?(rest, <<c>>) do
      false
    else
      isogram?(rest)
    end
  end

  @doc """
  Converts a number to its roman numeral representation.
  See https://www.britannica.com/topic/Roman-numeral for the details on how Romans represented numbers.

  Assume the input number n <= 3000.

  ## Examples

    iex> roman_numeral(2008)
    "MMVIII"

    iex> roman_numeral(91)
    "XCI"

  """
  def roman_numeral(0), do: ""
  def roman_numeral(number) when number >= 1000, do: "M" <> roman_numeral(number - 1000)
  def roman_numeral(number) when number >= 900, do: "CM" <> roman_numeral(number - 900)
  def roman_numeral(number) when number >= 500, do: "D" <> roman_numeral(number - 500)
  def roman_numeral(number) when number >= 400, do: "CD" <> roman_numeral(number - 400)
  def roman_numeral(number) when number >= 100, do: "C" <> roman_numeral(number - 100)
  def roman_numeral(number) when number >= 90, do: "XC" <> roman_numeral(number - 90)
  def roman_numeral(number) when number >= 50, do: "L" <> roman_numeral(number - 50)
  def roman_numeral(number) when number >= 40, do: "XL" <> roman_numeral(number - 40)
  def roman_numeral(number) when number >= 10, do: "X" <> roman_numeral(number - 10)
  def roman_numeral(number) when number >= 9, do: "IX" <> roman_numeral(number - 9)
  def roman_numeral(number) when number >= 5, do: "V" <> roman_numeral(number - 5)
  def roman_numeral(number) when number >= 4, do: "IV" <> roman_numeral(number - 4)
  def roman_numeral(number) when number >= 1, do: "I" <> roman_numeral(number - 1)

  @doc """
  The Collatz Conjecture or `3x + 1` problem can be summarized as follows:

    Take any positive integer n.
    * If n is even, divide n by 2 to get n / 2.
    * If n is odd, multiply n by 3 and add 1 to get 3n + 1.
    * Repeat the process indefinitely.

    The conjecture states that no matter which number you start with, you will always reach 1 eventually.

    Given a number `n`, return the number of steps required to reach 1.

    See https://en.wikipedia.org/wiki/Collatz_conjecture.

    ## Examples

      iex> collatz(12)
      9

      iex> collatz(21)
      7

  """
  def collatz(n) when is_integer(n) and n > 0, do: collatz(n, 0)

  defp collatz(1, steps), do: steps
  defp collatz(n, steps) when rem(n, 2) == 0, do: collatz(div(n, 2), steps + 1)
  defp collatz(n, steps), do: collatz(n * 3 + 1, steps + 1)
end
