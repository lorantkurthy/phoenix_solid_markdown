defmodule PhoenixSolidMarkdown.Engine do
  @moduledoc """
  a single public function (compile) that Phoenix uses to compile incoming templates. You should not need to call it yourself. 
  """

  @behaviour Phoenix.Template.Engine

  # --------------------------------------------------------
  @doc """
  Callback implementation for `Phoenix.Template.Engine.compile/2`

  Precompiles the template at `path` into a function defintion, using the Solid and Earmark engines.

  ### Parameters
    * `path` path to the template being compiled
    * `name` name of the template being compiled
    
  """
  def compile(path, name) do
    # get the earmark options from config and cast into the right struct
    earmark_options =
      case Application.get_env(:phoenix_solid_markdown, :earmark) do
        %Earmark.Options{} = opts ->
          opts

        %{} = opts ->
          Kernel.struct!(Earmark.Options, opts)

        _ ->
          %Earmark.Options{}
      end

    md_content =
      path
      |> File.read!()
      |> Earmark.as_html!(earmark_options)
      
    {:ok, solid_content} =
      md_content
      |> Solid.parse()

    PhoenixSolidMarkdown.solid_render(solid_content)
  end
end
