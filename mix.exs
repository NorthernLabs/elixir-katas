defmodule ElixirKatas.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_katas,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: [],
      preferred_cli_env: [katas: :test]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end
end
