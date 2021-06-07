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
      accounts: get_accounts(),
      open_form_account_to_create: false
      )}
  end

  def render(assigns) do
    ~L"""

      <div id="scrolleable" class="inline-flex w-full">

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
            <div id="container_accounts" class="h-hoch-76 overflow-y-scroll rounded-b-lg">
              <table class="w-full">
                <tbody class="text-gray-600 text-sm font-light">
                  <%= for item <- @accounts do %>
                      <tr class="border-b border-gray-200 hover:bg-gray-50">
                        <th class="w-25/100 py-3 px-3 text-left text-xs font-extralight"><%= item.code %></th>
                        <th class="w-25/100 py-3 px-3 text-left text-xs font-extralight">
                          <div class="flex items-center">
                            <div class="mr-2">
                              <%= if item.name == "Estela Núñez López" do %>
                                <img class="w-8 h-8 rounded-full" src="https://scontent.fmex25-1.fna.fbcdn.net/v/t1.6435-9/122786268_779904336077292_8374628320378406392_n.jpg?_nc_cat=104&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeESl1Gd_fy8OdVvXirSTeil1NSXUA5umdXU1JdQDm6Z1Ud6b_NjJgPJsTllknrmVzmupcUSnwZ0jEj0XE7HtUJZ&_nc_ohc=jwa2LCeixi0AX_mWzV1&_nc_ht=scontent.fmex25-1.fna&oh=3b2e03aa3648df3f6c4f55c3135b0c2e&oe=60E2810D"/>
                              <% else %>
                                <img class="w-8 h-8 rounded-full" src="https://scontent.fmex25-1.fna.fbcdn.net/v/t1.6435-9/194272443_1939691989517805_8284756727911889351_n.jpg?_nc_cat=109&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeEhylSdNFXg8cAqHzDbAAqJ3g4eHnzbotneDh4efNui2f0omA5pnJ9riScAGhxr9hzKJF6syu2ArpatswgzIWZw&_nc_ohc=OIz3ivaL1PQAX_dHCnu&_nc_ht=scontent.fmex25-1.fna&oh=ed1ba9c324aeec06c134c02317d78a87&oe=60E505A8"/>
                              <% end %>
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
                <button class="rounded-full" phx-click="open_form_account_to_create" phx-target="#accounts">
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

        <div>
          <%= if @open_form_account_to_create, do: live_component(@socket, GotenWeb.FormAccountComponent, id: "new")%>
        </div>

      </div>

    """
  end

  def handle_event("open_form_account_to_create", _params, socket) do
    {:noreply, assign(
      socket,
      open_form_account_to_create: true
    )}
  end

  def handle_event("close", _params, socket) do
    {:noreply, assign(
      socket,
      open_form_account_to_create: false
      )}
  end

  def get_accounts() do
    Goten.Accounts.list_accounts
  end

end
