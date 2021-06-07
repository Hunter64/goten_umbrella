defmodule GotenWeb.FormAccountComponent do
  @moduledoc """
    Componente formulario
  """
  use Phoenix.LiveComponent
  use Phoenix.HTML

  def mount(socket) do
    {:ok, socket}
  end

  def update(_attrs, socket) do
    {:ok, socket}
    # {:ok, assign(
    #   socket
    #   )}
  end

  def render(assigns) do
    ~L"""
    <div class="mt-20">
      ASDFAFSF
    </div>
    """
  end

end
