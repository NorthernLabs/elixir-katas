defmodule Mix.Tasks.Katas do
  @moduledoc """
  This task runs the ElixirKatas test suite.
  It will display a function description that you need to implement to get the test passing.
  Continue until all tests pass.

  ## Usage

    mix katas

    mix katas -n concurrent

  ## Command line options

    * `--name`, `-n` - runs a specific kata.

  """
  @shortdoc "Short exercises to learn the Elixir language."
  @preferred_cli_env :test

  use Mix.Task

  @katas ~w(lists pattern_matching concurrent otp)

  @impl Mix.Task
  def run(args) do
    {opts, _} = OptionParser.parse!(args, strict: [name: :string], aliases: [n: :name])
    tag = Keyword.get(opts, :name, :all)

    Mix.Task.run("test", config(tag))
  end

  defp config(tag) when tag in @katas do
    ["--only=#{tag}" | config(:all)]
  end

  defp config(:all) do
    [
      "--max-failures=1",
      "--seed=0",
      "--formatter=ElixirKatas.TestFormatter"
    ]
  end

  defp config(tag) do
    Mix.raise("Invalid kata #{tag}")
  end
end
