defmodule Download.FileName do

  @moduledoc """
    Module contains functions to download files from an url.
  """

  def get_file(url, name) do
    download_file(HTTPoison.get(url), name)
  end

  def download_file({:error, %HTTPoison.Error{reason: reason}}, _name) do
    IO.puts "Error, reason: #{reason}"
    {:error, reason}
  end

  def download_file({:ok, %HTTPoison.Response{body: body}}, name) do
    name
    |> File.write(body)
    |> save_file()
  end

  def save_file(:ok) do
    IO.puts "Todo ok"
    :ok
  end

  def save_file(result = {:error, reason}) do
    IO.puts "Something went wrong reason: #{reason}"
    result
  end

end
