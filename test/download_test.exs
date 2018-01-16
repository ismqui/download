defmodule DownloadTest do
  use ExUnit.Case
  doctest Download

  test "greets the world" do
    assert Download.hello() == :world
  end
end
