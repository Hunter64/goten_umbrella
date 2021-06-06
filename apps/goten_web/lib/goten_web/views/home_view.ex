defmodule GotenWeb.HomeView do
  use GotenWeb, :view
end

defmodule GotenWeb.HomeLiveView do

  use Phoenix.LiveView

  def render(assigns) do
    Phoenix.View.render(GotenWeb.HomeView, "index.html", assigns)
  end

  def mount(_params, session, socket) do
    session = session #(for {key, val} <- session, into: %{}, do: {String.to_atom(key), val})

      {:ok, assign(socket,
      session: session
      )}
  end

end
