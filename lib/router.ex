defmodule Router do
  use Plug.Router

  if Mix.env != :test, do: plug Plug.Logger

  plug :match
  plug :dispatch

  get "/" do
    {:ok, hostname} = :inet.gethostname
    response = "I'm " <> List.to_string(hostname)

    send_resp(conn, 200, response)
  end

  match _ do
    send_resp(conn, 404, "")
  end
end
