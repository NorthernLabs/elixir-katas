defmodule Mix.Tasks.Katas do
  @shortdoc "Short excercises to learn the Elixir language."
  @preferred_cli_env :test

  use Mix.Task

  @impl Mix.Task
  def run(_args) do
    Mix.Task.run("test", ["--max-failures=1", "--seed=0"])
  end
end
