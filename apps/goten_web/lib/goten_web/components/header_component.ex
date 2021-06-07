defmodule GotenWeb.HeaderComponent do
  @moduledoc """
  Componente con menú principal
  """
  use Phoenix.LiveComponent
  use Phoenix.HTML

  def mount(socket) do
    {:ok, assign(socket, menu: [])}
  end

  def update(_attrs, socket) do
    {:ok, assign(socket, menu: get_menu(), sub_menu: get_sub_menu(), version: Application.get_env(:burns_web, Version)[:version])}
  end

  def render(assigns) do
    ~L"""

    <div class="fixed w-full py-2 bg-blue-700 top-0 left-0 z-40 border-b-2 border-blue-100">
      <div class="flex">
        <div>
          <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Dragon_Ball_Super.png/1200px-Dragon_Ball_Super.png" class="w-56 ml-6 h-16">
        </div>

        <div class="ml-auto block text-right">
          <p class="font-bold text-lg text-white -mt-1">Batman</p>
          <p class="text-medium text-white -mt-1 ">Miembro en La Liga de las Sombras</p>
          <p class="font-bold text-xs text-white -mt-1 -mb-2 ">Versión <%= @version %></p>
        </div>

        <div class="inline-flex items-center ml-2 mr-2">
          <svg aria-hidden="true" focusable="false" data-prefix="fad" data-icon="user-tie" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"
            class="h-8 w-8 ml-2 mr-auto">
            <g class="fa-group">
              <path fill="currentColor" d="M191.35 414.77L208 344l-32-56h96l-32 56 16.65 70.77L224 480zM224 256A128 128 0 1 0 96 128a128 128 0 0 0 128 128z"
                class="text-white">
              </path>
              <path fill="currentColor" d="M319.8 288.6L224 480l-95.8-191.4C56.9 292 0 350.3 0 422.4V464a48 48 0 0 0 48 48h352a48 48 0 0 0 48-48v-41.6c0-72.1-56.9-130.4-128.2-133.8z"
                class="text-white">
              </path>
            </g>
          </svg>
        </div>

        <div class="border-r-2 border-gray-500"></div>


      </div>
    </div>

    <div class="fixed top-0 left-0 h-screen px-2 bg-white block z-30 shadow-lg transition-menu w-16 mt-5">
      <div class="block h-16"></div>
      <%= for item <- @menu do %>
        <div class="block my-3 relative">
          <%= if item.has_sub_menu do %>
            <div onmouseover="showSubMenu('<%= item.name_for_sub %>')" onmouseout="hiddenSubMenu('<%= item.name_for_sub %>')">
              <a href="#" class="rounded hover:border-gray-200 text-gray-800 hover:bg-gray-200 py-1 inline-flex items-center w-full">
                <%= Phoenix.HTML.raw(item.icon ) %>
                <label class="cursor-pointer ml-2 mr-auto font-bold transition-menu-label"><%= item.name_for_sub %></label>
              </a>
              <div class="submenu px-2 bg-white shadow-lg absolute -top-20 right-0 -mr-56 w-full" id="<%= item.name_for_sub %>">
                <%= for item2 <- get_sub_menu_by_menu(item.parent, @sub_menu) do %>
                  <div class="inline-block my-1 w-full">
                    <a href="<%= item2.link %>" class="cursor-pointer relative rounded hover:border-gray-200 text-gray-800 hover:bg-gray-200 py-1 inline-flex items-center w-full">
                      <%= Phoenix.HTML.raw(item2.icon ) %>
                      <label class="cursor-pointer ml-2 mr-auto font-bold transition-menu-label "><%= item2.name_for_sub %></label>
                    </a>
                  </div>
                <% end %>
              </div>
            </div>
          <% else %>
            <a href="<%= item.link %>" class="rounded hover:border-gray-200 text-gray-800 hover:bg-gray-200 py-1 inline-flex items-center w-full">
              <div><%= Phoenix.HTML.raw(item.icon) %></div>
              <label class="cursor-pointer ml-2 mr-auto font-bold transition-menu-label"><%= item.name_for_sub %></label>
            </a>
          <% end %>
        </div>
      <% end %>
    </div>

    <script>
      function showSubMenu(name) {
        sub = document.getElementById(name)
        if(sub != null) {
          sub.style.display = "inherit";
        }
      }

      function hiddenSubMenu(name) {
        sub = document.getElementById(name)
        if(sub != null) {
          sub.style.display = "none";
        }
      }
    </script>

    """
  end

  defp get_sub_menu_by_menu(parent, sub_menu) do
    sub_menu
      |> Enum.filter(fn x -> x.parent == parent end)
  end

  defp get_sub_menu() do
    [
      %{
        parent: 4,
        has_sub_menu: false,
        name_for_sub: "Cuentas",
        link: "/accounts",
        icon: """
          <svg aria-hidden="true" focusable="false" data-prefix="fad" data-icon="mail-bulk" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" class="h-8 w-8 ml-2 mr-auto">
            <g class="fa-group">
              <path fill="currentColor" d="M288 256H32a32 32 0 0 0-32 32v16c25.6 19.2 22.4 19.2 115.2 86.4 9.6 6.4 28.8 25.6 44.8 25.6s35.2-19.2 44.8-22.4c92.8-67.2 89.6-67.2 115.2-86.4V288a32 32 0 0 0-32-32zM160 448c-25.6 0-51.2-22.4-64-32-64-44.8-83.2-60.8-96-70.4V480a32 32 0 0 0 32 32h256a32 32 0 0 0 32-32V345.6c-12.8 9.6-32 25.6-96 70.4-12.8 9.6-38.4 32-64 32zm288-224v64h64v-64z" class="text-blue-400"></path>
              <path fill="currentColor" d="M544 160H224a32 32 0 0 0-32 32v32h96a64.09 64.09 0 0 1 63.71 57.82l.29-.22V416h192a32 32 0 0 0 32-32V192a32 32 0 0 0-32-32zm-32 128h-64v-64h64zm-64-160V32a32 32 0 0 0-32-32H96a32 32 0 0 0-32 32v192h96v-32a64.07 64.07 0 0 1 64-64z" class="text-blue-900"></path>
            </g>
          </svg>
        """
      },
      %{
        parent: 4,
        has_sub_menu: false,
        name_for_sub: "Registros",
        link: "/",
        icon: """
          <svg aria-hidden="true" focusable="false" data-prefix="fad" data-icon="ballot-check" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" class="h-8 w-8 ml-2 mr-auto">
            <g class="fa-group">
              <path fill="currentColor" d="M360 0H24A23.94 23.94 0 0 0 0 24v464a23.94 23.94 0 0 0 24 24h336a23.94 23.94 0 0 0 24-24V24a23.94 23.94 0 0 0-24-24zM161.7 202.4l12.6 12.7a5.37 5.37 0 0 1 0 7.6l-64.2 63.6a5.37 5.37 0 0 1-7.6 0L65.6 249a5.37 5.37 0 0 1 0-7.6l12.7-12.6a5.37 5.37 0 0 1 7.6 0l20.6 20.8 47.6-47.2a5.37 5.37 0 0 1 7.6 0zM64 112a16 16 0 0 1 16-16h32a16 16 0 0 1 16 16v32a16 16 0 0 1-16 16H80a16 16 0 0 1-16-16zm64 288a16 16 0 0 1-16 16H80a16 16 0 0 1-16-16v-32a16 16 0 0 1 16-16h32a16 16 0 0 1 16 16zm192-8a8 8 0 0 1-8 8H168a8 8 0 0 1-8-8v-16a8 8 0 0 1 8-8h144a8 8 0 0 1 8 8zm-9.6-120H170.2s29.2-30.2 30.4-32h109.7c5.3 0 9.6 3.6 9.6 8v16h.1c0 4.4-4.3 8-9.6 8zm9.6-136a8 8 0 0 1-8 8H168a8 8 0 0 1-8-8v-16a8 8 0 0 1 8-8h144a8 8 0 0 1 8 8z" class="text-blue-400"></path>
              <path fill="currentColor" d="M80 160h32a16 16 0 0 0 16-16v-32a16 16 0 0 0-16-16H80a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16zm94.3 55.1l-12.6-12.7a5.37 5.37 0 0 0-7.6 0l-47.6 47.2-20.6-20.8a5.37 5.37 0 0 0-7.6 0l-12.7 12.6a5.37 5.37 0 0 0 0 7.6l36.9 37.3a5.37 5.37 0 0 0 7.6 0l64.2-63.6a5.37 5.37 0 0 0 0-7.6zM112 352H80a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16h32a16 16 0 0 0 16-16v-32a16 16 0 0 0-16-16z" class="text-blue-900"></path>
            </g>
          </svg>
        """
      },
      %{
        parent: 4,
        has_sub_menu: false,
        name_for_sub: "Reportes",
        link: "/",
        icon: """
          <svg aria-hidden="true" focusable="false" data-prefix="fad" data-icon="calendar-exclamation" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="h-8 w-8 ml-2 mr-auto">
            <g class="fa-group">
              <path fill="currentColor" d="M0 192v272a48 48 0 0 0 48 48h352a48 48 0 0 0 48-48V192zm196.18 48h55.02a12 12 0 0 1 12 12v.83l-7.2 112A12 12 0 0 1 244 376h-40a12 12 0 0 1-12-11.2l-7.2-112a12.1 12.1 0 0 1 11.38-12.8zM224 472a40 40 0 1 1 40-40 40 40 0 0 1-40 40zM112 128h32a16 16 0 0 0 16-16V16a16 16 0 0 0-16-16h-32a16 16 0 0 0-16 16v96a16 16 0 0 0 16 16zm192 0h32a16 16 0 0 0 16-16V16a16 16 0 0 0-16-16h-32a16 16 0 0 0-16 16v96a16 16 0 0 0 16 16z" class="text-blue-400"></path>
              <path fill="currentColor" d="M224 392a40 40 0 1 0 40 40 40 40 0 0 0-40-40zm-20-16h40a12 12 0 0 0 12-11.2l7.2-112A12 12 0 0 0 252 240h-55.2a12.1 12.1 0 0 0-12 12.18v.62l7.2 112a12 12 0 0 0 12 11.2zM400 64h-48v48a16 16 0 0 1-16 16h-32a16 16 0 0 1-16-16V64H160v48a16 16 0 0 1-16 16h-32a16 16 0 0 1-16-16V64H48a48 48 0 0 0-48 48v80h448v-80a48 48 0 0 0-48-48z" class="text-blue-900"></path>
            </g>
          </svg>
        """
      },
      %{
        parent: 6,
        has_sub_menu: false,
        name_for_sub: "Tipos de Documento",
        link: "/document_types",
        icon: """
          <svg aria-hidden="true" focusable="false" data-prefix="fad" data-icon="cabinet-filing" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="h-8 w-8 ml-2 mr-auto">
            <g class="fa-group">
              <path fill="currentColor" d="M0 480a32 32 0 0 0 32 32h448a32 32 0 0 0 32-32V256H0zm160-112a16 16 0 0 1 16-16h160a16 16 0 0 1 16 16v40a8 8 0 0 1-8 8h-16a8 8 0 0 1-8-8v-24H192v24a8 8 0 0 1-8 8h-16a8 8 0 0 1-8-8zM480 0H32A32 32 0 0 0 0 32v192h512V32a32 32 0 0 0-32-32zM352 152a8 8 0 0 1-8 8h-16a8 8 0 0 1-8-8v-24H192v24a8 8 0 0 1-8 8h-16a8 8 0 0 1-8-8v-40a16 16 0 0 1 16-16h160a16 16 0 0 1 16 16z" class="text-blue-400"></path>
              <path fill="currentColor" d="M336 96H176a16 16 0 0 0-16 16v40a8 8 0 0 0 8 8h16a8 8 0 0 0 8-8v-24h128v24a8 8 0 0 0 8 8h16a8 8 0 0 0 8-8v-40a16 16 0 0 0-16-16zm0 256H176a16 16 0 0 0-16 16v40a8 8 0 0 0 8 8h16a8 8 0 0 0 8-8v-24h128v24a8 8 0 0 0 8 8h16a8 8 0 0 0 8-8v-40a16 16 0 0 0-16-16z" class="text-blue-900"></path>
            </g>
          </svg>
        """
      },
      %{
        parent: 6,
        has_sub_menu: false,
        name_for_sub: "Competidores",
        link: "/competitors",
        icon: """
          <svg aria-hidden="true" focusable="false" data-prefix="fad" data-icon="users" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" class="h-8 w-8 ml-2 mr-auto">
            <g class="fa-group">
              <path fill="currentColor" d="M96 224a64 64 0 1 0-64-64 64.06 64.06 0 0 0 64 64zm480 32h-64a63.81 63.81 0 0 0-45.1 18.6A146.27 146.27 0 0 1 542 384h66a32 32 0 0 0 32-32v-32a64.06 64.06 0 0 0-64-64zm-512 0a64.06 64.06 0 0 0-64 64v32a32 32 0 0 0 32 32h65.9a146.64 146.64 0 0 1 75.2-109.4A63.81 63.81 0 0 0 128 256zm480-32a64 64 0 1 0-64-64 64.06 64.06 0 0 0 64 64z" class="text-blue-400"></path>
              <path fill="currentColor" d="M396.8 288h-8.3a157.53 157.53 0 0 1-68.5 16c-24.6 0-47.6-6-68.5-16h-8.3A115.23 115.23 0 0 0 128 403.2V432a48 48 0 0 0 48 48h288a48 48 0 0 0 48-48v-28.8A115.23 115.23 0 0 0 396.8 288zM320 256a112 112 0 1 0-112-112 111.94 111.94 0 0 0 112 112z" class="text-blue-900"></path>
            </g>
          </svg>
        """
      },
      %{
        parent: 6,
        has_sub_menu: false,
        name_for_sub: "Probabilidades",
        link: "/probabilities",
        icon: """
          <svg aria-hidden="true" focusable="false" data-prefix="fad" data-icon="user-chart" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" class="h-8 w-8 ml-2 mr-auto">
            <g class="fa-group">
              <path fill="currentColor" d="M592 0H208c-26.47 0-48 22.25-48 49.59V96c23.42 0 45.1 6.78 64 17.8V64h352v288H307.76a127.45 127.45 0 0 1 39.69 64H592c26.47 0 48-22.25 48-49.59V49.59C640 22.25 618.47 0 592 0zM312 217.94l55 55a24 24 0 0 0 34 .06l72-72 24.3 24.3c11.34 11.34 30.73 3.31 30.73-12.73V124a12 12 0 0 0-12-12h-88.57c-16 0-24.07 19.39-12.73 30.73L439 167l-55 55-55-55a24 24 0 0 0-34 0l-14.75 14.75C285 195.07 288 209.13 288 224a126.17 126.17 0 0 1-2 19.95z" class="text-blue-400"></path>
              <path fill="currentColor" d="M160 320a96 96 0 1 0-96-96 96 96 0 0 0 96 96zm48 32h-3.81c-13.93 4.83-28.64 8-44.19 8s-30.26-3.17-44.19-8H112A112 112 0 0 0 0 464a48 48 0 0 0 48 48h224a48 48 0 0 0 48-48 112 112 0 0 0-112-112z" class="text-blue-900"></path>
            </g>
          </svg>
        """
      },
      %{
        parent: 6,
        has_sub_menu: false,
        name_for_sub: "Tipos de Oportunidad",
        link: "/opportunity_types",
        icon: """
          <svg aria-hidden="true" focusable="false" data-prefix="fad" data-icon="file-invoice-dollar" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" class="h-8 w-8 ml-2 mr-auto">
            <g class="fa-group">
              <path fill="currentColor" d="M384 128H272a16 16 0 0 1-16-16V0H24A23.94 23.94 0 0 0 0 23.88V488a23.94 23.94 0 0 0 23.88 24H360a23.94 23.94 0 0 0 24-23.88V128zM64 72a8 8 0 0 1 8-8h80a8 8 0 0 1 8 8v16a8 8 0 0 1-8 8H72a8 8 0 0 1-8-8zm0 80v-16a8 8 0 0 1 8-8h80a8 8 0 0 1 8 8v16a8 8 0 0 1-8 8H72a8 8 0 0 1-8-8zm144 263.88V440a8 8 0 0 1-8 8h-16a8 8 0 0 1-8-8v-24.29a57.32 57.32 0 0 1-31.37-11.35 8 8 0 0 1-.57-12.14L155.81 381a8.22 8.22 0 0 1 10.13-.73 24.06 24.06 0 0 0 12.82 3.73h28.11c6.5 0 11.8-5.92 11.8-13.19 0-5.95-3.61-11.19-8.77-12.73l-45-13.5c-18.59-5.58-31.58-23.42-31.58-43.39 0-24.52 19.05-44.44 42.67-45.07V232a8 8 0 0 1 8-8h16a8 8 0 0 1 8 8v24.29a57.17 57.17 0 0 1 31.37 11.35 8 8 0 0 1 .57 12.14L228.18 291a8.22 8.22 0 0 1-10.13.73 24 24 0 0 0-12.82-3.73h-28.11c-6.5 0-11.8 5.92-11.8 13.19 0 5.95 3.61 11.19 8.77 12.73l45 13.5c18.59 5.58 31.58 23.42 31.58 43.39 0 24.53-19 44.44-42.67 45.07z" class="text-blue-400"></path>
              <path fill="currentColor" d="M377 105L279.1 7a24 24 0 0 0-17-7H256v112a16 16 0 0 0 16 16h112v-6.1a23.9 23.9 0 0 0-7-16.9zM219.09 327.42l-45-13.5c-5.16-1.54-8.77-6.78-8.77-12.73 0-7.27 5.3-13.19 11.8-13.19h28.11a24 24 0 0 1 12.82 3.73 8.22 8.22 0 0 0 10.13-.73l11.76-11.22a8 8 0 0 0-.57-12.14A57.17 57.17 0 0 0 208 256.29V232a8 8 0 0 0-8-8h-16a8 8 0 0 0-8 8v24.12c-23.62.63-42.67 20.55-42.67 45.07 0 20 13 37.81 31.58 43.39l45 13.5c5.16 1.54 8.77 6.78 8.77 12.73 0 7.27-5.3 13.19-11.8 13.19h-28.12a24.06 24.06 0 0 1-12.82-3.73 8.22 8.22 0 0 0-10.13.73l-11.75 11.22a8 8 0 0 0 .57 12.14A57.32 57.32 0 0 0 176 415.71V440a8 8 0 0 0 8 8h16a8 8 0 0 0 8-8v-24.12c23.67-.63 42.67-20.54 42.67-45.07 0-19.97-12.99-37.81-31.58-43.39z" class="text-blue-900"></path>
            </g>
          </svg>
        """
      }
    ]
  end

  defp get_menu(),
    do: [
      %{
        parent: 1,
        has_sub_menu: false,
        name_for_sub: "Inicio",
        link: "/home",
        icon: """
          <svg aria-hidden="true" focusable="false" data-prefix="fad" data-icon="home" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" class="h-8 w-8 ml-2 mr-auto">
            <g>
              <path fill="currentColor" d="M336 463.59V368a16 16 0 0 0-16-16h-64a16 16 0 0 0-16 16v95.71a16 16 0 0 1-15.92 16L112 480a16 16 0 0 1-16-16V300.06l184.39-151.85a12.19 12.19 0 0 1 15.3 0L480 300v164a16 16 0 0 1-16 16l-112-.31a16 16 0 0 1-16-16.1z" class="text-blue-500"></path>
              <path fill="currentColor" d="M573.32 268.35l-25.5 31a12 12 0 0 1-16.9 1.65L295.69 107.21a12.19 12.19 0 0 0-15.3 0L45.17 301a12 12 0 0 1-16.89-1.65l-25.5-31a12 12 0 0 1 1.61-16.89L257.49 43a48 48 0 0 1 61 0L408 116.61V44a12 12 0 0 1 12-12h56a12 12 0 0 1 12 12v138.51l83.6 68.91a12 12 0 0 1 1.72 16.93z" class="text-blue-900"></path>
            </g>
          </svg>
        """
      },
      %{
        parent: 3,
        has_sub_menu: false,
        name_for_sub: "Carga de archivos",
        link: "/file",
        icon: """
          <svg aria-hidden="true" focusable="false" data-prefix="fad" data-icon="file-alt" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" class="h-8 w-8 ml-2 mr-auto">
            <g class="fa-group">
              <path fill="currentColor" d="M384 128H272a16 16 0 0 1-16-16V0H24A23.94 23.94 0 0 0 0 23.88V488a23.94 23.94 0 0 0 23.88 24H360a23.94 23.94 0 0 0 24-23.88V128zm-96 244a12 12 0 0 1-12 12H108a12 12 0 0 1-12-12v-8a12 12 0 0 1 12-12h168a12 12 0 0 1 12 12zm0-64a12 12 0 0 1-12 12H108a12 12 0 0 1-12-12v-8a12 12 0 0 1 12-12h168a12 12 0 0 1 12 12zm0-64a12 12 0 0 1-12 12H108a12 12 0 0 1-12-12v-8a12 12 0 0 1 12-12h168a12 12 0 0 1 12 12z" class="text-blue-500"></path>
              <path fill="currentColor" d="M377 105L279.1 7a24 24 0 0 0-17-7H256v112a16 16 0 0 0 16 16h112v-6.1a23.9 23.9 0 0 0-7-16.9zM276 352H108a12 12 0 0 0-12 12v8a12 12 0 0 0 12 12h168a12 12 0 0 0 12-12v-8a12 12 0 0 0-12-12zm0-64H108a12 12 0 0 0-12 12v8a12 12 0 0 0 12 12h168a12 12 0 0 0 12-12v-8a12 12 0 0 0-12-12zm0-64H108a12 12 0 0 0-12 12v8a12 12 0 0 0 12 12h168a12 12 0 0 0 12-12v-8a12 12 0 0 0-12-12z" class="text-blue-900"></path>
            </g>
          </svg>
        """
      },
      %{
        parent: 4,
        has_sub_menu: true,
        name_for_sub: "Registros $",
        link: "/",
        icon: """
          <svg aria-hidden="true" focusable="false" data-prefix="fad" data-icon="edit" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" class="h-8 w-8 ml-2 mr-auto">
            <g class="fa-group">
              <path fill="currentColor" d="M564.6 60.2l-48.8-48.8a39.11 39.11 0 0 0-55.2 0l-35.4 35.4a9.78 9.78 0 0 0 0 13.8l90.2 90.2a9.78 9.78 0 0 0 13.8 0l35.4-35.4a39.11 39.11 0 0 0 0-55.2zM427.5 297.6l-40 40a12.3 12.3 0 0 0-3.5 8.5v101.8H64v-320h229.8a12.3 12.3 0 0 0 8.5-3.5l40-40a12 12 0 0 0-8.5-20.5H48a48 48 0 0 0-48 48v352a48 48 0 0 0 48 48h352a48 48 0 0 0 48-48V306.1a12 12 0 0 0-20.5-8.5z" class="text-blue-500"></path>
              <path fill="currentColor" d="M492.8 173.3a9.78 9.78 0 0 1 0 13.8L274.4 405.5l-92.8 10.3a19.45 19.45 0 0 1-21.5-21.5l10.3-92.8L388.8 83.1a9.78 9.78 0 0 1 13.8 0z" class="text-blue-900"></path>
            </g>
          </svg>
        """
      },
      %{
        parent: 5,
        has_sub_menu: false,
        name_for_sub: "Reporte General",
        link: "/",
        icon: """
          <svg aria-hidden="true" focusable="false" data-prefix="fad" data-icon="list" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="h-8 w-8 ml-2 mr-auto">
            <g class="fa-group">
              <path fill="currentColor" d="M496 384H176a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16h320a16 16 0 0 0 16-16v-32a16 16 0 0 0-16-16zm0-320H176a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16h320a16 16 0 0 0 16-16V80a16 16 0 0 0-16-16zm0 160H176a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16h320a16 16 0 0 0 16-16v-32a16 16 0 0 0-16-16z" class="text-blue-500"></path>
              <path fill="currentColor" d="M80 368H16a16 16 0 0 0-16 16v64a16 16 0 0 0 16 16h64a16 16 0 0 0 16-16v-64a16 16 0 0 0-16-16zm0-320H16A16 16 0 0 0 0 64v64a16 16 0 0 0 16 16h64a16 16 0 0 0 16-16V64a16 16 0 0 0-16-16zm0 160H16a16 16 0 0 0-16 16v64a16 16 0 0 0 16 16h64a16 16 0 0 0 16-16v-64a16 16 0 0 0-16-16z" class="text-blue-900"></path>
            </g>
          </svg>
        """
      },
      %{
        parent: 6,
        has_sub_menu: false,
        name_for_sub: "Catálogos",
        link: "/",
        icon: """
          <svg aria-hidden="true" focusable="false" data-prefix="fad" data-icon="layer-group" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="h-8 w-8 ml-2 mr-auto">
            <g class="fa-group">
              <path fill="currentColor" d="M12.41 236.31L70.51 210l161.63 73.27a57.64 57.64 0 0 0 47.72 0L441.5 210l58.09 26.33c16.55 7.5 16.55 32.5 0 40L266.64 381.9a25.68 25.68 0 0 1-21.29 0L12.41 276.31c-16.55-7.5-16.55-32.5 0-40z" class="text-blue-500"></path>
              <path fill="currentColor" d="M12.41 148l232.94 105.7a25.61 25.61 0 0 0 21.29 0L499.58 148c16.55-7.51 16.55-32.52 0-40L266.65 2.32a25.61 25.61 0 0 0-21.29 0L12.41 108c-16.55 7.5-16.55 32.52 0 40zm487.18 216.11l-57.87-26.23-161.86 73.37a57.64 57.64 0 0 1-47.72 0L70.29 337.88l-57.88 26.23c-16.55 7.5-16.55 32.5 0 40L245.35 509.7a25.68 25.68 0 0 0 21.29 0l233-105.59c16.5-7.5 16.5-32.5-.05-40z" class="text-blue-900"></path>
            </g>
          </svg>
        """
      },
      %{
        parent: 7,
        has_sub_menu: false,
        name_for_sub: "Dashboard",
        link: "/",
        icon: """
          <svg aria-hidden="true" focusable="false" data-prefix="fad" data-icon="chart-pie" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 544 512" class="h-8 w-8 ml-2 mr-auto">
            <g class="fa-group">
              <path fill="currentColor" d="M379.86 443.87c6.85 6.85 6.33 18.48-1.57 24.08A238.14 238.14 0 0 1 243 512C114.83 513.59 4.5 408.51.14 280.37-4.1 155.6 87 51.49 206.16 34.65c9.45-1.34 17.84 6.51 17.84 16.06V288z" class="text-blue-500"></path>
              <path fill="currentColor" d="M512 223.2C503.72 103.74 408.26 8.28 288.8 0 279.68-.59 272 7.1 272 16.24V240h223.77c9.14 0 16.82-7.68 16.23-16.8zm15.79 64.8H290.5l158 158c6 6 16 6.53 22.19.68a239.5 239.5 0 0 0 73.13-140.86c1.37-9.43-6.48-17.82-16.03-17.82z" class="text-blue-900"></path>
            </g>
          </svg>
        """
      }
    ]

end
