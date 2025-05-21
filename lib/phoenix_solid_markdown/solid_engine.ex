defmodule PhoenixSolidMarkdown.SolidEngine do
  @moduledoc """
  a single public function (compile) that Phoenix uses to compile incoming templates. You should not need to call it yourself. 
  """

  @behaviour Phoenix.Template.Engine

  # --------------------------------------------------------
  @doc """
  Callback implementation for `Phoenix.Template.Engine.compile/2`

  Precompiles the template at `path` into a function defintion, using the Solid engine.

  ### Parameters
    * `path` path to the template being compiled
    * `name` name of the template being compiled
    
  """
  def compile(path, name) do
    {:ok, solid_content} =
      path
      |> File.read!()
      |> Solid.parse()

    PhoenixSolidMarkdown.solid_render(solid_content)
  end
end
