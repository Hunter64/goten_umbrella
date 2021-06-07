defmodule GotenWeb.AccountView do
  use GotenWeb, :view
end

defmodule GotenWeb.AccountLiveView do

  use Phoenix.LiveView

  def render(assigns) do
    Phoenix.View.render(GotenWeb.AccountView, "index.html", assigns)
  end

  def mount(_params, session, socket) do
    session = session #(for {key, val} <- session, into: %{}, do: {String.to_atom(key), val})

      {:ok, assign(socket,
      session: session
      )}
  end

  def handle_info({_reference, %{message: params}}, socket) do
    case params do
      "close_notification" -> send_update(GotenWeb.NotificationComponent, id: "notification", show: false)
    end
    {:noreply, socket}
  end

  def handle_info({:DOWN, _reference, _process, _pid, _normal}, socket) do
    {:noreply, socket}
  end

end
