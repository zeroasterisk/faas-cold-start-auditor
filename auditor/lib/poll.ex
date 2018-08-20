defmodule Poll do
  @moduledoc """
  Main Polling Interface

  Request URL X count (times) in Y concurrent_requests
  """
  require Logger

  @doc """
  Do count requests, with concurrent in parallell
  """
  def requests(count, concurrent, url) do
    [] |> Poll.requests_loop(count, concurrent, url)
  end

  @doc """
  Do concurrent_requests in bursts, over and over, until done
  """
  def requests_loop(res, 0, _concurrent, _url), do: res
  def requests_loop(res, count, concurrent, url) when count < concurrent, do: Poll.requests_loop(res, count, count, url)
  def requests_loop(res, count, concurrent, url) do
    next_count = max(0, count - concurrent)
    res ++ concurrent_requests(concurrent, url)
    |> Poll.requests_loop(next_count, concurrent, url)
  end

  @doc """
  Do concurrent requests to a URL

  If we send 1 concurrent requests, it is a single process
  Any more than 1, and we are firing parallel requests in linked sub-processes
  """
  def concurrent_requests(concurrent, url) do
    # Logger.info "Pummelling #{url} with #{concurrent} requests"
    # making this simple, just X async requests now
    1..concurrent
    |> Enum.map(fn _ ->
      Task.async(fn ->
        Poll.Worker.start(url)
      end)
    end)
    |> Enum.map(&Task.await(&1, :infinity))
    # filter to only :ok responses (200ish)
    |> Enum.filter(fn ({status, _ms}) -> status == :ok end)
    # simplify to only a list of durations in ms
    |> Enum.map(fn({:ok, ms}) -> ms end)
  end
end
