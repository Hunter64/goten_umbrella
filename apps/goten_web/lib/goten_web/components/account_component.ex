defmodule GotenWeb.AccountComponent do
  @moduledoc """
    Componente de listado
  """
  use Phoenix.LiveComponent
  use Phoenix.HTML

  def mount(socket) do
    {:ok, socket}
  end

  def update(_attrs, socket) do
    {:ok, assign(
      socket,
      accounts: get_accounts_test()
      )}
  end

  def render(assigns) do
    ~L"""
    <div id="accounts" class="h-hoch-80 w-80 mt-20 ml-16 block float-left bg-white w-240">

      <div class="mt-2 w-240 bg-white shadow-md rounded my-6">
        <div id="header_accounts">
          <table class=" w-full table-auto">
            <thead class="p-4 border-b-2 border-blue-100">
              <tr class="bg-gray-200 text-gray-600 uppercase text-sm leading-normal">
                <th class="rounded-tl-lg w-25/100 font-bold text-sm py-2">Código</th>
                <th class="w-25/100 font-bold text-sm py-2">Nombre</th>
                <th class="w-25/100 font-bold text-sm py-2">Descripción</th>
                <th class="w-5/100 font-bold text-sm py-2">Naturaleza</th>
                <th class="rounded-tr-lg w-20/100 font-bold text-sm py-2">Fecha Alta</th>
              </tr>
            </thead>
          </table>
        </div>
        <div id="container_accounts" class="h-hoch-78 overflow-y-scroll rounded-b-lg">
          <table class="w-full">
            <tbody class="text-gray-600 text-sm font-light">
              <%= for item <- @accounts do %>
                  <tr class="border-b border-gray-200 hover:bg-gray-50">
                    <th class="w-25/100 py-3 px-3 text-left text-xs font-extralight"><%= item.code %></th>
                    <th class="w-25/100 py-3 px-3 text-left text-xs font-extralight">
                      <div class="flex items-center">
                        <div class="mr-2">
                            <img class="w-6 h-6 rounded-full" src="https://randomuser.me/api/portraits/men/1.jpg"/>
                        </div>
                        <span><%= item.name %></span>
                      </div>
                    </th>
                    <th class="w-25/100 py-3 px-3 text-left text-xs font-extralight"><%= item.description %></th>
                    <th class="w-5/100 py-3 px-3 text-left text-xs font-extralight">
                      <%= if item.nature == "Acreedora" do %>
                        <span class="bg-green-200 text-green-600 py-1 px-3 rounded-full text-xs">
                          <%= item.nature %>
                        </span>
                      <% else %>
                        <span class="bg-red-200 text-green-600 py-1 px-3 rounded-full text-xs">
                          <%= item.nature %>
                        </span>
                      <% end %>

                    </th>
                    <th class="w-20/100 py-3 px-3 text-left text-xs font-extralight"><%= item.inserted_at %></th>
                  </tr>
              <% end %>
            </tbody>
          </table>
        </div>
        <div id="footer" class="py-6 inline-flex w-full">
          <div class="w-10/12">
            <label class="text-xs">Cuentas: <b><%= (@accounts) |> Enum.count %></b></label>
          </div>
          <div class="w-2/12">
            <button class="rounded-full">
              <svg aria-hidden="true" focusable="false" data-prefix="fad" data-icon="plus-circle" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="h-12 w-12">
                <g class="fa-group">
                  <path fill="currentColor" d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8zm144 276a12 12 0 0 1-12 12h-92v92a12 12 0 0 1-12 12h-56a12 12 0 0 1-12-12v-92h-92a12 12 0 0 1-12-12v-56a12 12 0 0 1 12-12h92v-92a12 12 0 0 1 12-12h56a12 12 0 0 1 12 12v92h92a12 12 0 0 1 12 12z" class="text-green-700"></path>
                  <path fill="currentColor" d="M400 284a12 12 0 0 1-12 12h-92v92a12 12 0 0 1-12 12h-56a12 12 0 0 1-12-12v-92h-92a12 12 0 0 1-12-12v-56a12 12 0 0 1 12-12h92v-92a12 12 0 0 1 12-12h56a12 12 0 0 1 12 12v92h92a12 12 0 0 1 12 12z" class="text-green-300"></path>
                </g>
              </svg>
            </button>
          </div>
        </div>
      </div>

    </div>
    """
  end

  def get_accounts_test() do
    [
      %{
        code: "codigo",
        name: "doña estela",
        description: "voy a ahorar vatos",
        nature: "Acreedora",
        inserted_at: "asdfasfsfasdf"
      },
      %{
        code: "otro codigo",
        name: "juliana",
        description: "su pedo",
        nature: "Acreedora",
        inserted_at: "asdfasfsfasdf"
      },
      %{
        code: "codigo",
        name: "doña asdf",
        description: "asdfafasfdfasfsfasd asfasfasdfadsf asfasf",
        nature: "Deudora",
        inserted_at: "asdfasfsfasdf"
      }
    ]
  end


end
