# FaaS Cold Start Auditor

Goal: audit "function as a service" for "cold start times" across various providers, language runtimes, and implementation features.

## Roadmap

- [ ] build testing framework (in Elixir, or as GCP functions)
- [ ] log results to DB
- [ ] build test cases

### Target Test Configs

Build a test runner, which can create http requests to functions and track function duration.

Matrix the following configurations and run multiple iterations for each of the target cases:
- [ ] "how long since last invocation" (in sec) [1, 10, 30, 60, 90, 120, 240, 480, 1024]
- [ ] "how many invocations to run in parallel" (in sec) [1, 2, 5, 10, 15, 20, 30, 60, 90, 120, 240, 480, 1024]
- [ ] "day of week" [1 - 7] *(unsure)*
- [ ] "hour of day" [1 - 24] *(unsure)*

### Target Cases

Matrix the following factors, and build a function for each:
- node4, node8, python, go
- small_runtime, large_runtime
- small_codebase, large_codebase
- gcp_functions, aws_lambda (same code, run in multiple runtimes)

Results:
- [ ] node4-small_runtime-small_codebase
- [ ] node4-small_runtime-large_codebase
- [ ] node4-large_runtime-small_codebase
- [ ] node4-large_runtime-large_codebase

- [ ] node8-small_runtime-small_codebase
- [ ] node8-small_runtime-large_codebase
- [ ] node8-large_runtime-small_codebase
- [ ] node8-large_runtime-large_codebase

- [ ] python-small_runtime-small_codebase
- [ ] python-small_runtime-large_codebase
- [ ] python-large_runtime-small_codebase
- [ ] python-large_runtime-large_codebase

- [ ] go-small_runtime-small_codebase
- [ ] go-small_runtime-large_codebase
- [ ] go-large_runtime-small_codebase
- [ ] go-large_runtime-large_codebase

