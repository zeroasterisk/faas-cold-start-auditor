defmodule Auditor.MixProject do
  use Mix.Project

  def project do
    [
      app: :auditor,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :goth],
      mod: {Auditor.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:combination, "~> 0.0.3"},
      {:timex, "~> 3.1"},
      {:excheck, "~> 0.6", only: :test},
      {:mix_test_watch, "~> 0.6", only: :dev, runtime: false},
      {:diplomat, "~> 0.9"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
