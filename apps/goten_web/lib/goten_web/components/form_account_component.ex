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
    {:ok, assign(
      socket,
      natures: get_natures()
    )}
  end

  def render(assigns) do
    ~L"""

    <div id="form_account" class="bg-white mt-20 ml-1 w-200 h-hoch-80" phx-hook="scroll_x">

      <div class="inline-flex bg-blue-700 text-white px-6 py-2 w-full">
        <div class="inline-block">
          <label class="text-xl font-normal text-white block">Crear nueva cuenta</label>
        </div>
        <button phx-click="close" phx-target="#accounts" class="ml-auto h-8 -mt-1 -mr-3">
          <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="times-circle" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="h-5 w-5 ml-auto">
            <path fill="currentColor" d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8zm121.6 313.1c4.7 4.7 4.7 12.3 0 17L338 377.6c-4.7 4.7-12.3 4.7-17 0L256 312l-65.1 65.6c-4.7 4.7-12.3 4.7-17 0L134.4 338c-4.7-4.7-4.7-12.3 0-17l65.6-65-65.6-65.1c-4.7-4.7-4.7-12.3 0-17l39.6-39.6c4.7-4.7 12.3-4.7 17 0l65 65.7 65.1-65.6c4.7-4.7 12.3-4.7 17 0l39.6 39.6c4.7 4.7 4.7 12.3 0 17L312 256l65.6 65.1z" class=""></path>
          </svg>
        </button>
      </div>

      <div class="w-full inline-block h-auto">
        <form id="form_new_edit" phx-submit="save_edit_account" phx-target="#form_account">
          <div class="w-full px-5 py-6">
            <label class="block text-base">Cuenta: </label>
            <input type="text" name="code" maxlength="128" class="border-blue-100 text-sm focus:outline-none focus:bg-white focus:border-blue-500 appearance-none block w-full bg-blue-50 text-gray-700 border rounded py-1 px-4 leading-tight focus:outline-none focus:bg-white" id="input_code" placeholder="Código de Cuenta" value="">
          </div>
          <div class="w-full px-5 py-6">
            <label class="block text-base">Nombre: </label>
            <input type="text" name="name" maxlength="128" class="border-blue-100 text-sm focus:outline-none focus:bg-white focus:border-blue-500 appearance-none block w-full bg-blue-50 text-gray-700 border rounded py-1 px-4 leading-tight focus:outline-none focus:bg-white" id="input_name" placeholder="Nombre" value="">
          </div>
          <div class="w-full px-5 py-6">
            <label class="block text-base">Descripción: </label>
            <input type="text" name="description" maxlength="128" class="border-blue-100 text-sm focus:outline-none focus:bg-white focus:border-blue-500 appearance-none block w-full bg-blue-50 text-gray-700 border rounded py-1 px-4 leading-tight focus:outline-none focus:bg-white" id="input_description" placeholder="Descripción" value="">
          </div>
          <div class="w-full px-5 py-6">
            <label class="block text-base">Naturaleza: </label>

              <div class="relative">
                <select id="nature" name="nature" class="border-blue-100 text-sm focus:outline-none focus:bg-white focus:border-blue-500 appearance-none w-full bg-blue-50 text-gray-700 border rounded py-1 px-2 leading-tight focus:outline-none focus:bg-white">
                  <%= for item <- @natures do %>
                    <option value="<%= item.char %>" >
                      <%= item.name %>
                    </option>
                  <% end %>
                </select>
                <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 h-6 text-gray-700">
                  <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
                </div>
              </div>

          </div>

          <div class="inline-flex mt-10 w-full text-center">
            <div class="flex w-9/12">
            </div>
            <div class="flex w-2/12">
              <button type="submit" form="form_new_edit" class="w-full mr-2 ml-2 py-2 bg-green-500 text-white hover:bg-green-400 items-center inline-flex font-bold rounded shadow focus:shadow-outline focus:outline-none rounded">
                <svg aria-hidden="true" focusable="false" data-prefix="fad" data-icon="save" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="h-4 w-4 mr-2 ml-3">
                  <g class="fa-group">
                    <path fill="currentColor" d="M288 352a64 64 0 1 1-64-64 64 64 0 0 1 64 64z" class="text-white"></path>
                    <path fill="currentColor" d="M433.94 129.94l-83.88-83.88A48 48 0 0 0 316.12 32H48A48 48 0 0 0 0 80v352a48 48 0 0 0 48 48h352a48 48 0 0 0 48-48V163.88a48 48 0 0 0-14.06-33.94zM224 416a64 64 0 1 1 64-64 64 64 0 0 1-64 64zm96-204a12 12 0 0 1-12 12H76a12 12 0 0 1-12-12V108a12 12 0 0 1 12-12h228.52a12 12 0 0 1 8.48 3.52l3.48 3.48a12 12 0 0 1 3.52 8.48z" class="text-white"></path>
                  </g>
                </svg>
                  Guardar
              </button>
            </div>
            <div class="flex w-1/12">
            </div>
          </div>

        </form>
      </div>

    </div>

    """
  end

  def handle_event("save_edit_account", params, socket) do
    params
      |> build_map
      |> save_new
    {:noreply, socket}
  end

  def build_map(params) do
    Map.new()
      |> Map.put(:code, params["code"])
      |> Map.put(:description, params["description"])
      |> Map.put(:name, params["name"])
      |> Map.put(:nature, params["nature"])
      |> Map.put(:active, true)
      |> Map.put(:creator_user_id, 1)
  end

  def save_new(account) do
    account
      |> Goten.Accounts.create_account
  end

  def get_natures do
    [
      %{id: 1, char: "A", name: "Acreedora"},
      %{id: 2, char: "D", name: "Deudora"}
    ]
  end

end
