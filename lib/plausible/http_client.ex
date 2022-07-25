defmodule Plausible.HTTPClient do
  @moduledoc """
  HTTP Client built on top of Finch.
  """

  @doc """
  Make a POST request
  """
  def post(url, header \\ [], params \\ nil) do
    call(:post, url, header, params)
  end

  @doc """
  Make a GET request
  """
  def get(url, header \\ [], params \\ nil) do
    call(:get, url, header, params)
  end

  defp call(method, url, header, params) do
    method
    |> build_request(url, header, params)
    |> do_request
  end

  defp build_request(:post, url, header, params) do
    Finch.build(:post, url, header, params)
  end

  defp do_request(request) do
    Finch.request(request, Plausible.Finch)
  end
end
