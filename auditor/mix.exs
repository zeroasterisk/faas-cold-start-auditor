defmodule Auditor.MixProject do
  use Mix.Project

  def project do
    [
      app: :auditor,
      version: "0.1.1",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
        # :goth
    [
      extra_applications: [
        :logger
      ],
      mod: {Auditor.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # TODO choose one
      {:combination, "~> 0.0.3"},
      # {:comb, github: "tallakt/comb"},
      {:timex, "~> 3.1"},
      {:httpoison, "~> 1.2"},
      # {:elixometer, github: "pinterest/elixometer"},
      # {:diplomat, "~> 0.9"}
      # {:excheck, "~> 0.6", only: :test},
      {:credo, "~> 0.10.0", only: [:dev, :test], runtime: false},
      {:mix_test_watch, "~> 0.6", only: :dev, runtime: false},
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
