defmodule Mix.Tasks.Serve do
  use Mix.Task

  def run(args) do
    Mix.Task.run "run", default_args() ++ args
  end

  defp default_args, do: ["--no-halt"]
end
