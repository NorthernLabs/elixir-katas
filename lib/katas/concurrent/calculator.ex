defmodule ElixirKatas.Concurrent.Calculator do
  @moduledoc """
  Concurrent programming katas.

  Make use of [processes](https://elixir-lang.org/getting-started/processes.html) to solve these excercises.

  Simple calculator server (sum, substraction, multiplication, and division) using processes and message-passing.
  You should implement the following functions:

  `start/0`: This function will spawn a calculator server.
  `stop/1`: Shuts down the calculator server.

  `add/3`, `subtract/3`, `multiply/3`, `divide/3`: These perform addition, subtraction, multiplication and division in
  the calculator server and then send a message back with the response.
  """

  @type calculator :: pid()

  @doc """
  Starts a calculator server.
  """
  @spec start() :: calculator()
  def start do
    spawn(&calculator_loop/0)
  end

  @doc """
  Stops a calculator server.
  """
  @spec stop(calculator()) :: true
  def stop(calculator) do
    send(calculator, :stop)
  end

  @doc """
  Adds `a` and `b` using the calculator server.

  ## Examples

    iex> add(calculator, 1, 3)
    4

  """
  @spec add(calculator(), number(), number()) :: number()
  def add(calculator, a, b) do
    send_msg(calculator, {:add, a, b})
  end

  @doc """
  Subtracts `b` from `a` using the calculator server.

  ## Examples

    iex> subtract(calculator, 1, 3)
    -2

  """
  @spec subtract(calculator(), number(), number()) :: number()
  def subtract(calculator, a, b) do
    send_msg(calculator, {:subtract, a, b})
  end

  @doc """
  Multiplies `a` by `b` using the calculator server.

  ## Examples

    iex> multiply(calculator, 5, 3)
    15

  """
  @spec multiply(calculator(), number(), number()) :: number()
  def multiply(calculator, a, b) do
    send_msg(calculator, {:multiply, a, b})
  end

  @doc """
  Divides `a` by `b` using the calculator server.

  ## Examples

    iex> divide(calculator, 9, 3)
    3

  """
  @spec divide(calculator(), number(), number()) :: number()
  def divide(calculator, a, b) do
    send_msg(calculator, {:divide, a, b})
  end

  defp calculator_loop do
    receive do
      {from, {:add, a, b}} ->
        send(from, a + b)

      {from, {:subtract, a, b}} ->
        send(from, a - b)

      {from, {:multiply, a, b}} ->
        send(from, a * b)

      {from, {:divide, a, b}} ->
        send(from, a / b)

      :stop ->
        exit(:normal)
    end

    calculator_loop()
  end

  defp send_msg(calculator, msg) do
    send(calculator, {self(), msg})

    receive do
      answer -> answer
    end
  end
end
