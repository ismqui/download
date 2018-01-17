defmodule DownloadTest do
  use ExUnit.Case
  doctest Download

  test "greets the world" do
    assert Download.hello() == :world
  end

  test "download file from url that exist" do
    url = "http://www.ine.es/jaxi/files/_px/es/csv_c/t26/p067/p01/serie/l0/01001.csv_c?nocab=1"
    assert Download.get_file(url) == :ok
  end

  test "download file from url that does not exist" do
    assert Download.get_file("noexiste") == :error
  end
end
