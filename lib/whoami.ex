defmodule Whoami do
  use Application

  @default_port 4001

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    port = Application.get_env(:whoami, :port, @default_port)
    children = [
      Plug.Adapters.Cowboy.child_spec(:http, Router, [], [port: port])
    ]

    opts = [strategy: :one_for_one, name: Whoami.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
