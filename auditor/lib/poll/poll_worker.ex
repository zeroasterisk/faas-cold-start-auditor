defmodule Poll.Worker do
  # from: https://github.com/benjamintanweihao/the-little-elixir-otp-guidebook-code/blob/master/chapter_8/blitzy/lib/worker.ex
  use Timex
  require Logger

  def start(url) do
    {timestamp, response} = Duration.measure(fn -> HTTPoison.get(url) end)
    handle_response({Duration.to_milliseconds(timestamp), response})
  end

  defp handle_response({msecs, {:ok, %HTTPoison.Response{status_code: code}}})
  when code == 200 do
    # Logger.info "worker [#{node()}-#{inspect self()}] completed in #{msecs} msecs"
    {:ok, msecs}
  end

  defp handle_response({msecs, {:ok, %HTTPoison.Response{status_code: code}}})
  when code >= 201 and code <= 304 do
    Logger.info "worker got status_code[#{code}] completed in #{msecs} msecs"
    {:ok, msecs}
  end

  defp handle_response({_msecs, {:error, reason}}) do
     Logger.info "worker [#{node()}-#{inspect self()}] error due to #{inspect reason}"
    {:error, reason}
  end

  defp handle_response({_msecs, _}) do
     Logger.info "worker [#{node()}-#{inspect self()}] errored out"
    {:error, :unknown}
  end

end
