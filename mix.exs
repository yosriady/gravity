defmodule Gravity.Mixfile do
  use Mix.Project

  def project do
    [app: :gravity,
     version: "1.0.0",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:dialyxir, "~> 0.3.5", only: [:dev]},
      {:ex_doc, "~> 0.13", only: :dev},
      {:earmark, "~> 1.0.1", only: :dev},
      {:credo, "~> 0.4", only: [:dev, :test]}
    ]
  end

  defp description do
      """
      Generates memorable names similar to Xaddress or Heroku. Supports custom
      words, custom delimiters, and custom reducer functions.
      """
  end

  defp package do
      [
          files: ["lib", "mix.exs", "README.md"],
          maintainers: ["Yos Riady"],
          licenses: ["MIT"],
          links: %{"GitHub" => "https://github.com/yosriady/gravity",
          "Docs" => "http://hexdocs.pm/gravity/"}
      ]
  end
end
