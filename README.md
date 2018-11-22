# Elixir Playground

**TODO: Add description**

## Requirements

* Phoenix 1.4.0 or later
* Elixir 1.7 or later
* Erlang 21 or later

## Development

Some tools need to be installed globally:

    $ mix archive.install hex sobelow
    $ mix dialyzer --plt

### Code Analysis

    $ mix sobelow --config -r apps/playground_web
    $ mix credo
    $ mix dialyzer

### Documentation

Generate project documentation and check its quality:

    $ mix docs
    $ mix inch

## Installation

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Change to Phoenix directory with `cd apps/playground_web`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## License

See [LICENSE](LICENSE).
