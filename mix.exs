defmodule PhoenixSolidMarkdown.Mixfile do
  use Mix.Project

  @version "0.1.0-rc.0"
  @github "https://github.com/lorantkurthy/phoenix_solid_markdown"

  def project do
    [
      app: :phoenix_solid_markdown,
      name: "phoenix_solid_markdown",
      version: @version,
      elixir: "~> 1.1",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      description: description(),
      package: package(),
      source_url: @github,
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:phoenix, ">= 1.1.0"},
      {:phoenix_html, ">= 2.3.0"},
      {:earmark, "~> 1.2"},         # Markdown interpreter
      {:html_entities, "~> 0.4"},
      {:solid, "~> 1.0.0-rc.0"},

      # Docs dependencies
      {:ex_doc, ">= 0.0.0", only: [:dev, :docs]},
      {:inch_ex, ">= 0.0.0", only: :docs},
      {:credo, "~> 0.8.10", only: [:dev, :test], runtime: false}
    ]
  end

  defp docs do
    [
      main: "PhoenixSolidMarkdown",
      source_ref: "v#{@version}",
      source_url: @github,
      extras: ["README.md"]
    ]
  end

  defp description() do
    """
    Markdown Template Engine with Liquid expressions for Phoenix. Uses Earmark and Solid to render.
    """
  end

  defp package do
    %{
      contributors: ["Lorant Kurthy"],
      maintainers: ["Lorant Kurthy"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @github,
      }
    }
  end
end
