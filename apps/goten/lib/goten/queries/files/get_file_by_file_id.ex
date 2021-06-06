defmodule Goten.GerFileByFileId do

  import Ecto.Query, warn: false

  def get_file_by_file_id(file_id) do
    from f in Goten.Files.File, where: f.file_id == ^file_id
  end

end
