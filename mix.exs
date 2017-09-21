defmodule Exercism.Mixfile do
  use Mix.Project

  def project do
    [
      app: :exercism,
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      #test_coverage: [tool: ExCoveralls],
      #preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test, "coveralls.post": :test]
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:credo, "~> 0.8", only: :dev, runtime: false},
      {:dialyxir, "~> 0.5", only: :dev, runtime: false},
      #{:excoveralls, "~> 0.7", only: :test, runtime: false},  # errors when compiling a dependency; causes 'mix test' to fail
      {:exfmt, "~> 0.5", only: :dev, runtime: false},
      {:mix_test_watch, "~> 0.5", only: :dev, runtime: false}
    ]
  end
end
