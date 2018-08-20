defmodule SchedulerTest do
  use ExUnit.Case
  doctest Scheduler

  test "matrix all scheduler parts" do
    [first_schedule | tail_schedules] = Scheduler.matrix()
    assert first_schedule == %Schedule{
      concurrency: 1,
      count: 1,
      count_200: nil,
      delay: 1,
      end_datetime: nil,
      func_id: nil,
      func_name: nil,
      schedule_id: nil,
      scheduled_datetime: nil,
      start_datetime: nil
    }
    assert tail_schedules |> Enum.at(15) == %Schedule{
      concurrency: 10,
      count: 120,
      count_200: nil,
      delay: 1,
      end_datetime: nil,
      func_id: nil,
      func_name: nil,
      schedule_id: nil,
      scheduled_datetime: nil,
      start_datetime: nil
    }
    assert tail_schedules |> Enum.at(25) == %Schedule{
      concurrency: 120,
      count: 240,
      count_200: nil,
      delay: 1,
      end_datetime: nil,
      func_id: nil,
      func_name: nil,
      schedule_id: nil,
      scheduled_datetime: nil,
      start_datetime: nil
    }
    assert tail_schedules |> Enum.at(85) == %Schedule{
      concurrency: 120,
      count: 1024,
      count_200: nil,
      delay: 10,
      end_datetime: nil,
      func_id: nil,
      func_name: nil,
      schedule_id: nil,
      scheduled_datetime: nil,
      start_datetime: nil
    }
  end
  test "assign_func" do
    func_name = "go-lg_cpu_load-lg_codebase-aws_lambda"
    func_id = "889ED20CE1DB4C6BBD8E7B9AE21A2F90"
    first_schedule = Scheduler.matrix() |> List.first()
    assert Scheduler.assign_func(first_schedule, func_name, func_id) == %Schedule{
      concurrency: 1,
      count: 1,
      count_200: nil,
      delay: 1,
      end_datetime: nil,
      func_id: "889ED20CE1DB4C6BBD8E7B9AE21A2F90",
      func_name: "go-lg_cpu_load-lg_codebase-aws_lambda",
      schedule_id: nil,
      scheduled_datetime: nil,
      start_datetime: nil
    }
  end
  test "assign_schedule_id" do
    sched = %Schedule{
      concurrency: 1,
      count: 1,
      count_200: nil,
      delay: 1,
      end_datetime: nil,
      func_id: "889ED20CE1DB4C6BBD8E7B9AE21A2F90",
      func_name: "go-lg_cpu_load-lg_codebase-aws_lambda",
      schedule_id: nil,
      scheduled_datetime: nil,
      start_datetime: nil
    }
    assert Scheduler.assign_schedule_id(sched) == %Schedule{
      concurrency: 1,
      count: 1,
      count_200: nil,
      delay: 1,
      end_datetime: nil,
      func_id: "889ED20CE1DB4C6BBD8E7B9AE21A2F90",
      func_name: "go-lg_cpu_load-lg_codebase-aws_lambda",
      schedule_id: "889ED20CE1DB4C6BBD8E7B9AE21A2F90Z1Z1Z1",
      scheduled_datetime: nil,
      start_datetime: nil
    }
  end
end

