defmodule Funcs do
  @moduledoc """
  Configuration of all the functions that must exist for testing

  We want to matrix, combine all combinations of the following factors:
  - runtimes
  - size_cpu_load
  - size_codebase
  - host
  """


  # NOTE: this may need to be moved into configuration
  @runtime [
    :node4,
    :node8,
    :python,
    :go
  ]
  @size_cpu_load [
    :sm_cpu_load,
    # :md_cpu_load,
    :lg_cpu_load
  ]
  @size_codebase [
    :sm_codebase,
    # :md_codebase,
    :lg_codebase
  ]
  @host [
    :gcp_functions,
    :aws_lambda
  ]

  @doc """
  Matrix, create all combinations of functions we must have

  ## Examples

      iex> Funcs.matrix
      [
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

  """
  def matrix do
    for runtime <- @runtime, size_cpu_load <- @size_cpu_load, size_codebase <- @size_codebase, host <- @host do
      [runtime, size_cpu_load, size_codebase, host]
    end
    |> Enum.map(&matrix_join_factors/1)
  end
  defp matrix_join_factors(), do: :no_values
  defp matrix_join_factors(l) do
    l |> Enum.map(&Atom.to_string/1) |> Enum.join("-")
  end


  @doc """
  Generate an ID hash for a function name
  """
  def func_name_to_id(name), do: :crypto.hash(:md5 , name) |> Base.encode16()
end
