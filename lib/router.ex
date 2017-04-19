defmodule Router do
  use Plug.Router

  if Mix.env != :test, do: plug Plug.Logger

  plug :match
  plug :dispatch

  get "/" do
    {:ok, raw_hostname} = :inet.gethostname
    hostname = List.to_string(raw_hostname)

    send_resp(conn, 200, hostname)
  end

  match _ do
    send_resp(conn, 404, "")
  end
end
