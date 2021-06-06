defmodule GotenWeb.FileView do
  use GotenWeb, :view
end

defmodule GotenWeb.FileLiveView do

  use Phoenix.LiveView

  def render(assigns) do
    Phoenix.View.render(GotenWeb.FileView, "index.html", assigns)
  end

  def mount(_params, session, socket) do
    session = session #(for {key, val} <- session, into: %{}, do: {String.to_atom(key), val})

      {:ok, assign(socket,
      session: session
      )}
  end

end
