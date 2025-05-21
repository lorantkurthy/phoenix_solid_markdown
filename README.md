# Markdown Template Engine for Phoenix

A Markdown template engine for [Phoenix](https://www.phoenixframework.org/). It also lets you (optionally) embed Liquid tags to be evaluated on the server.

> Powered by [Earmark](https://github.com/pragdave/earmark) and [Solid](https://github.com/edgurgel/solid)

> Based on [phoenix_markdown](https://github.com/boydm/phoenix_markdown)

## Usage

1. Add `{:phoenix_solid_markdown, "~> 0.1.0-rc.0"}` to your deps in `mix.exs`.
2. Add the following to your Phoenix `config/config.exs`
```elixir
  config :phoenix, :template_solid_engines,
    md:     PhoenixSolidMarkdown.Engine,
    liquid: PhoenixSolidMarkdown.SolidEngine
```

If you are also using the [phoenix_markdown](https://github.com/boydm/phoenix_markdown) engine, then it should look like this:
```elixir
  config :phoenix, :template_engines,
    md:     PhoenixMarkdown.Engine,
    mds:    PhoenixSolidMarkdown.Engine,
    liquid: PhoenixSolidMarkdown.SolidEngine
```

3. Use the `.html.md` or `.html.mds` or `.html.liquid` extensions for your templates.

## Optional

Add md extension to Phoenix live reload in `config/dev.exs`

```elixir
  config :hello_phoenix, HelloPhoenix.Endpoint,
    live_reload: [
      web_console_logger: true,
      patterns: [
        ~r"priv/static/(?!uploads/).*(js|css|png|jpeg|jpg|gif|svg)$",
        ~r"priv/gettext/.*(po)$",
        ~r"lib/video_site_web/(?:controllers|live|components|router)/?.*\.(ex|heex|md|mds|liquid)$"
      ]
    ]
```
## Optional Earmark Configuration

You can configure phoenix_solid_markdown via one configuration block,
which will be passed to Earmark as it renders the markdown into html.

```elixir
  config :phoenix_solid_markdown, :earmark, %{
    gfm: true,
    breaks: true
  }
```

Please read the [Earmark Documentation](https://hexdocs.pm/earmark/Earmark.html#as_html!/2) to understand
the options that can go here.

### Unexpected Token in Server Tags

By default Earmark replaces some characters with prettier UTF-8 versions. For
example, single and double quotes are replaced with left- and right-handed
versions.  This may break any server tag which contains a prettified character
since EEx cannot interpret them as intended. To fix this, disable smartypants
processing and escaping.

```elixir
  config :phoenix_solid_markdown, :earmark, %{
    smartypants: false,
    escape: false
  }
```

[Markdown](https://daringfireball.net/projects/markdown/) is intended to be written by a human
in any simple text editor ( or a fancy one like [iA Writer](https://ia.net/writer) ). Just create
a file with the `.html.md` extension and drop it into the appropriate templates folder in your
phoenix application. Then you can use it just like any other template.
