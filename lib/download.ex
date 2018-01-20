defmodule Download do

  alias Download.FileName

  @moduledoc """
  Module contains the API for the application.
  """
  @doc """
  Downloads a file from an url and saves it in a given directory and name.

  ## Examples
      iex> url = "http://www.ine.es/jaxi/files/_px/es/csv_c/t26/p067/p01/serie/l0/01001.csv_c?nocab=1"
      iex> name = "assets/DatosAgua.txt"
      iex> Download.get_file(url, name)
      :ok

  """
  defdelegate get_file(url, name), to: FileName

end
