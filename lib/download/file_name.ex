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
    {:error, reason}
  end

  def download_file({:ok, %HTTPoison.Response{body: body}}, name) do
    result = File.write(name, body)
    case result do
      :ok -> IO.puts "Todo ok"
      {:error, reason} -> IO.puts "Something went wrong reason: #{reason}"
    end

    result
  end

end
