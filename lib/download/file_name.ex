defmodule Download.FileName do

  def get_file(url) do
  # %HTTPoison.Response{body: _body, status_code: status} = HTTPoison.get!(url)
    get_data(url)
  end

  def get_data(url) do
    download_file(HTTPoison.get(url))
  end

  def download_file({:error, %HTTPoison.Error{reason: reason}}) do
    IO.puts "Error, reason: #{reason}"
    :error
  end

  def download_file({:ok, %HTTPoison.Response{body: body}}) do
    IO.puts "Todo ok"
    File.write!("assets/agua.dat", body)
    :ok
  end

end
