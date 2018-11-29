defmodule PlaygroundApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :playground_api,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.7.4",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {PlaygroundApi.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:playground_db, in_umbrella: true},
      # Composable queries for Ecto
      {:inquisitor, "~> 0.5"},
      # JSON:API
      {:inquisitor_jsonapi, "~> 0.1.0"},
      {:plug_cowboy, "~> 2.0"},
      {:jason, "~> 1.1"}
    ]
  end
end
