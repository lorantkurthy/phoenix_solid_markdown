defmodule PhoenixSolidMarkdown.Mixfile do
  use Mix.Project

  @version "0.1.0"
  @github "https://github.com/lorantkurthy/phoenix_solid_markdown"

  def project do
    [
      app: :phoenix_solid_markdown,
      version: @version,
      elixir: "~> 1.1",
      deps: deps(),
      package: [
        contributors: ["Lorant Kurthy"],
        maintainers: ["Lorant Kurthy"],
        licenses: ["MIT"],
        links: %{
          "GitHub" => @github,
        }
      ],

      name: "phoenix_solid_markdown",
      source_url: @github,
      docs: docs(),
      description: """
      Markdown Template Engine with Liquid expressions for Phoenix. Uses Earmark and Solid to render.
      """
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

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
      extras: ["README.md"],
      source_ref: "v#{@version}",
      main: "PhoenixSolidMarkdown"
    ]
  end

end
