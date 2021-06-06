defmodule GotenWeb.HomeComponent do
  @moduledoc """
  Componente Home
  """
  use Phoenix.LiveComponent
  use Phoenix.HTML

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
      <div class="flex justify-center ml-96 mt-20 h-hoch-90">
        <img src="https://i.pinimg.com/originals/d2/5b/5b/d25b5bc6ec73d1d334523ecab1f055ed.png">
      </div>
    """
  end

end
