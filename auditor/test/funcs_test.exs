defmodule FuncsTest do
  use ExUnit.Case
  doctest Funcs

  test "matrix" do
    assert Funcs.matrix() == [
      "node4-sm_cpu_load-sm_codebase-gcp_functions",
      "node4-sm_cpu_load-sm_codebase-aws_lambda",
      "node4-sm_cpu_load-lg_codebase-gcp_functions",
      "node4-sm_cpu_load-lg_codebase-aws_lambda",
      "node4-lg_cpu_load-sm_codebase-gcp_functions",
      "node4-lg_cpu_load-sm_codebase-aws_lambda",
      "node4-lg_cpu_load-lg_codebase-gcp_functions",
      "node4-lg_cpu_load-lg_codebase-aws_lambda",
      "node8-sm_cpu_load-sm_codebase-gcp_functions",
      "node8-sm_cpu_load-sm_codebase-aws_lambda",
      "node8-sm_cpu_load-lg_codebase-gcp_functions",
      "node8-sm_cpu_load-lg_codebase-aws_lambda",
      "node8-lg_cpu_load-sm_codebase-gcp_functions",
      "node8-lg_cpu_load-sm_codebase-aws_lambda",
      "node8-lg_cpu_load-lg_codebase-gcp_functions",
      "node8-lg_cpu_load-lg_codebase-aws_lambda",
      "python-sm_cpu_load-sm_codebase-gcp_functions",
      "python-sm_cpu_load-sm_codebase-aws_lambda",
      "python-sm_cpu_load-lg_codebase-gcp_functions",
      "python-sm_cpu_load-lg_codebase-aws_lambda",
      "python-lg_cpu_load-sm_codebase-gcp_functions",
      "python-lg_cpu_load-sm_codebase-aws_lambda",
      "python-lg_cpu_load-lg_codebase-gcp_functions",
      "python-lg_cpu_load-lg_codebase-aws_lambda",
      "go-sm_cpu_load-sm_codebase-gcp_functions",
      "go-sm_cpu_load-sm_codebase-aws_lambda",
      "go-sm_cpu_load-lg_codebase-gcp_functions",
      "go-sm_cpu_load-lg_codebase-aws_lambda",
      "go-lg_cpu_load-sm_codebase-gcp_functions",
      "go-lg_cpu_load-sm_codebase-aws_lambda",
      "go-lg_cpu_load-lg_codebase-gcp_functions",
      "go-lg_cpu_load-lg_codebase-aws_lambda"
    ]
  end
  test "func_name_to_id should return md5 hash ids for func names" do
    assert "go-lg_cpu_load-lg_codebase-aws_lambda"
    |> Funcs.func_name_to_id() == "889ED20CE1DB4C6BBD8E7B9AE21A2F90"
  end
end
