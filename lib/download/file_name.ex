defmodule Download.FileName do

  @moduledoc """
    Module contains functions to download files from an url.
  """

  @doc """
  Downloads the body or the url and saves it in the directory with the name
  given in name.
  """
  @spec get_file(String.t, String.t) :: any
  def get_file(url, name) do
    download_file(HTTPoison.get(url), name)
  end

  @type poison_error :: %HTTPoison.Error{reason: String.t}
  @spec download_file({atom, poison_error}, any) :: {atom, String.t}
  def download_file({:error, %HTTPoison.Error{reason: reason}}, _name) do
    IO.puts "Error, reason: #{reason}"
    {:error, reason}
  end

  @type poison_resp :: %HTTPoison.Response{body: String.t}
  @spec download_file({atom, poison_resp}, String.t) :: any
  def download_file({:ok, %HTTPoison.Response{body: body}}, name) do
    name
    |> File.write(body)
    |> save_file()
  end

  def save_file(:ok) do
    IO.puts "Save ok"
    :ok
  end

  def save_file(result = {:error, reason}) do
    IO.puts "Something went wrong saving file reason: #{reason}"
    result
  end

end
