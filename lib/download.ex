defmodule Download do

  import Download.FileName

  @moduledoc """
  Documentation for Download.
  """
# "http://www.ine.es/jaxi/files/_px/es/csv_c/t26/p067/p01/serie/l0/01001.csv_c?nocab=1"
  @doc """
  Hello world.

  ## Examples

      iex> Download.hello
      :world

  """
  def hello do
    :world
  end

  defdelegate get_file(url), to: FileName

end
