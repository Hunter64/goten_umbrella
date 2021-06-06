defmodule GotenWeb.FileComponent do
  @moduledoc """
  Component File
  """
  use Phoenix.LiveComponent
  use Phoenix.HTML

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
      <div id="file" class="m-16">
        <div class="py-2">
          <button phx-click="insert" phx-target="#file" class="focus:outline-none focus:bg-white focus:border-blue-500 h-8 w-20 rounded border bg-red-200">
            Insertar
          </button>
        </div>

        <div class="py-2">
          <button phx-click="get" phx-target="#file" class="focus:outline-none focus:bg-white focus:border-blue-500 h-8 w-20 rounded border bg-red-200">
            <a href="/get_file" target="_blank">
            Recuperar
          </button>
        </div>
      </div>
    """
  end

  def handle_event("insert", _params, socket) do
    %{
      content: "content",
      file_id: Ecto.UUID.generate(),
      name: "name",
      user: 42
    }
    |> Goten.Files.create_file
    |> IO.inspect

    {:noreply, socket}
  end

end
