defmodule PollTest do
  use ExUnit.Case
  doctest Poll

  test "requests 10 total, 1 concurrant @ google" do
    res = Poll.requests(10, 1, "https://www.google.com/")
    # [262.364, 259.223, 262.516, 255.973, 256.028, 262.277, 259.421, 251.385, 259.483, 251.451]
    assert res |> Enum.count() == 10
    assert is_float(res |> List.first()) == true
  end
  test "requests 10 total, 3 concurrant @ google" do
    res = Poll.requests(10, 3, "https://www.google.com/")
    # [262.364, 259.223, 262.516, 255.973, 256.028, 262.277, 259.421, 251.385, 259.483, 251.451]
    assert res |> Enum.count() == 10
    assert is_float(res |> List.first()) == true
  end
  test "concurrent_requests 10 @ google" do
    res = Poll.concurrent_requests(10, "https://www.google.com/")
    # [262.364, 259.223, 262.516, 255.973, 256.028, 262.277, 259.421, 251.385, 259.483, 251.451]
    assert res |> Enum.count() == 10
    assert is_float(res |> List.first()) == true
  end

end

