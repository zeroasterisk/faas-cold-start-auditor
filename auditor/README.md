# (FaaS) Auditor

This is a small Elixir application to perform a series of execution tests
on faas runtimes, at various intervals,
with the goal of determining cold start times.

## Production / Usage

See Development Usage. (no prod release ATM)

## Development / Usage

[Install Elixir](https://elixir-lang.org/install.html)
and then `cd` into this directory.

### Configure secrets

You must setup application secrets to use this:

... TODO ...

### Verify tests all pass

Unit tests and integration tests should all pass:

```sh
$ mix test
```

### Start application

You can start the application (which will start running tests) with:

```sh
$ mix start
```

You can start the application (which will start running tests)
in an interactive REPL with:

```sh
$ iex -S mix
```


