defmodule TicketLockerAppWeb.PageController do
  use TicketLockerAppWeb, :controller

  def code(conn, params) do
    IO.inspect params
    params = %{
      code: params["code"],
      client_id: System.get_env("CLIENT_ID"),
      client_secret: System.get_env("CLIENT_SECRET")
    }
    res = HTTPotion.get("https://github.com/login/oauth/access_token", query: params);
    IO.inspect res
    render(conn, "index.html")
  end

  def index(conn, _params) do
    res = HTTPotion.get("https://github.com/login/oauth/authorize?client_id=" <> System.get_env("CLIENT_ID"))
    IO.inspect res.headers.hdrs["location"]
    redirect(conn, external: res.headers.hdrs["location"])
  end
end
