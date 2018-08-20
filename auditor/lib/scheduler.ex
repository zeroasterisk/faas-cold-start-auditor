defmodule Schedule do
  defstruct [
    schedule_id: nil,
    delay: nil,
    count: nil,
    concurrency: nil,
    func_id: nil,
    func_name: nil,
    scheduled_datetime: nil,
    start_datetime: nil,
    end_datetime: nil,
    count_200: nil,
    # dur_min: nil,
    # dur_max: nil,
    # dur_avg: nil,
    # dur_mean: nil,
  ]

  @doc """
  Is this scheduled batch complete
  """
  def is_done(%Schedule{end_datetime: nil}), do: false
  def is_done(%Schedule{}), do: true
end

defmodule Scheduler do
  @moduledoc """
  Schedule out all of the needed tests in batches.

  Glossary:
  - A single poll of a function = "poll"
  - Several polls of a single function = "batch"
  - Several batches of a tests = "schedule"

  Dimensions:
  - delay: how long since last poll (minimum delay between poll)
  - count: how many polls to run for the test batch
  - concurrency: how many polls to run in parallel
  """


  # NOTE: this may need to be moved into configuration
  @delay [1, 10, 30, 60, 90, 120, 240, 480, 1024]
  @count [1, 10, 30, 60, 90, 120, 240, 480, 1024]
  @concurrency [1, 10, 30, 60, 90, 120, 240, 480, 1024]


  @doc """
  Matrix the combinations of factors to build all schedule configurations

  ## Examples

      iex> Scheduler.matrix() |> List.first()
      %Schedule{
        count_200: nil,
        end_datetime: nil,
        func_id: nil,
        func_name: nil,
        scheduled_datetime: nil,
        start_datetime: nil,
        concurrency: 1,
        count: 1,
        delay: 1}

  """
  def matrix do
    for delay <- @delay, count <- @count, concurrency <- @concurrency do
      %Schedule{
        delay: delay,
        count: count,
        concurrency: concurrency,
      }
    end
  end

  @doc """
  Add a function to a Schedule
  """
  def assign_func(%Schedule{} = sched, func_name, func_id) do
    sched |> Map.merge(%{
      func_name: func_name,
      func_id: func_id,
    })
  end

  @doc """
  Add a schedule_id to a Schedule
  """
  def assign_schedule_id(%Schedule{
    func_id: func_id,
    delay: delay,
    count: count,
    concurrency: concurrency,
  } = sched) do
    sched |> Map.merge(%{
      schedule_id: [
        func_id,
        delay,
        count,
        concurrency,
      ] |> Enum.join("Z")
    })
  end

  @doc """
  Save this schedule to the database
  """
  def save(%Schedule{}) do
    TODO
  end

end
