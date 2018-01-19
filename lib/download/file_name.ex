defmodule Download.FileName do

  @moduledoc """
    Module contains functions to download files from an url.
  """

  def get_file(url, name) do
    get_data(url, name)
  end

  def get_data(url, name) do
    download_file(HTTPoison.get(url), name)
  end

  def download_file({:error, %HTTPoison.Error{reason: reason}}, _name) do
    IO.puts "Error, reason: #{reason}"
    :error
  end

  def download_file({:ok, %HTTPoison.Response{body: body}}, name) do
    IO.puts "Todo ok"
    File.write!(name, body)
    :ok
  end

end
