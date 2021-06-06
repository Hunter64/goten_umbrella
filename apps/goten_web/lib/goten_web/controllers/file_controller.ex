# defmodule GotenWeb.FileController do
#   use GotenWeb, :controller

#   alias Goten.Files
#   alias Goten.Files.File

#   def index(conn, _params) do
#     files = Files.list_files()
#     render(conn, "index.html", files: files)
#   end

#   def new(conn, _params) do
#     changeset = Files.change_file(%File{})
#     render(conn, "new.html", changeset: changeset)
#   end

#   def create(conn, %{"file" => file_params}) do
#     case Files.create_file(file_params) do
#       {:ok, file} ->
#         conn
#         |> put_flash(:info, "File created successfully.")
#         |> redirect(to: Routes.file_path(conn, :show, file))

#       {:error, %Ecto.Changeset{} = changeset} ->
#         render(conn, "new.html", changeset: changeset)
#     end
#   end

#   def show(conn, %{"id" => id}) do
#     file = Files.get_file!(id)
#     render(conn, "show.html", file: file)
#   end

#   def edit(conn, %{"id" => id}) do
#     file = Files.get_file!(id)
#     changeset = Files.change_file(file)
#     render(conn, "edit.html", file: file, changeset: changeset)
#   end

#   def update(conn, %{"id" => id, "file" => file_params}) do
#     file = Files.get_file!(id)

#     case Files.update_file(file, file_params) do
#       {:ok, file} ->
#         conn
#         |> put_flash(:info, "File updated successfully.")
#         |> redirect(to: Routes.file_path(conn, :show, file))

#       {:error, %Ecto.Changeset{} = changeset} ->
#         render(conn, "edit.html", file: file, changeset: changeset)
#     end
#   end

#   def delete(conn, %{"id" => id}) do
#     file = Files.get_file!(id)
#     {:ok, _file} = Files.delete_file(file)

#     conn
#     |> put_flash(:info, "File deleted successfully.")
#     |> redirect(to: Routes.file_path(conn, :index))
#   end
# end


defmodule GotenWeb.FileController do
  use GotenWeb, :controller
  alias Phoenix.LiveView

  def index(conn, _params) do
    conn
    |> LiveView.Controller.live_render(GotenWeb.FileLiveView, session: %{})
  end

  def show(conn, params) do
    params |> IO.inspect(label: " ---------------------> in show")
    file =  Goten.Files.get_file_by_file_id("109ee2f3-abae-467e-8c66-7faf2700dc10")
    result = file.content
    conn
      |> put_resp_content_type("application/pdf")
      |> put_resp_header("content-disposition", "attachment; filename=LibroDiario.pdf")
      |> Plug.Conn.send_resp(:ok, result)

  end

end
