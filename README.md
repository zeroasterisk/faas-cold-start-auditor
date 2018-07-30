# FaaS Cold Start Auditor

Goal: audit "function as a service" for "cold start times" across various providers, language runtimes, and implementation features.

## About Testing

We will run a series of tests, at various "time since last invocation"
and various "levels of parallel requests"
against a variety of difference function configurations.

Our goal here is to remove fluctuations and sample from a variety of times-of-day and days-of-week,
across a variety of factors.  The resulting benchmarking data will be made available,
and I will summarize any interesting results.

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

## Results

TODO

## How-To: force freshness (make your cold starts times disappear)

TODO write an example of how to force freshness for your functions:
(trigger `OPTIONS || healthcheck` periodically)

## References

Here are some articles about cold start times for Lambdas / Functions:

- https://medium.com/thundra/dealing-with-cold-starts-in-aws-lambda-a5e3aa8f532
- https://read.acloud.guru/how-long-does-aws-lambda-keep-your-idle-functions-around-before-a-cold-start-bf715d3b810
- https://hackernoon.com/im-afraid-you-re-thinking-about-aws-lambda-cold-starts-all-wrong-7d907f278a4f
- https://read.acloud.guru/cold-starting-lambdas-2c663055589e
- https://cloud.google.com/functions/docs/bestpractices/tips

Here are a few tools for triggering "function freshness":

- https://www.thundra.io/
- http://apex.run
