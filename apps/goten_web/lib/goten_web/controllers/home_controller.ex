defmodule GotenWeb.HomeController do
  use GotenWeb, :controller
  alias Phoenix.LiveView

  def index(conn, _params) do
    conn
    |> LiveView.Controller.live_render(GotenWeb.HomeLiveView, session: %{})
  end

end
