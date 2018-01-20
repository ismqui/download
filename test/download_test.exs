defmodule DownloadTest do
  use ExUnit.Case
  doctest Download

  alias Download.FileName

  test "download file from url that exist" do
    url = "http://www.ine.es/jaxi/files/_px/es/csv_c/t26/p067/p01/serie/l0/01001.csv_c?nocab=1"
    name = "assets/agua.dat"
    assert FileName.get_file(url, name) == :ok
  end

  test "download file from url that does not exist" do
    name = "assets/agua.dat"
    assert FileName.get_file("noexite", name) == {:error, :nxdomain}
  end

  test "download file from url to a directory that does not exist" do
    url = "http://www.ine.es/jaxi/files/_px/es/csv_c/t26/p067/p01/serie/l0/01001.csv_c?nocab=1"
    name = "noexiste/agua.dat"
    assert FileName.get_file(url, name) == {:error, :enoent}
  end
end
