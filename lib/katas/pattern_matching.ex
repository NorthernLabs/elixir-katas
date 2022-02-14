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
  def bmi_classification(weight, height) do
    :answer
  end

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
    :answer
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
  def isogram?(word) do
    :answer
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
  def roman_numeral(n) do
    :answer
  end

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
  def collatz(n) do
    :answer
  end
end
