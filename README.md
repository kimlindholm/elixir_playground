# Elixir Playground

Umbrella project with REST API, client and custom plug

## Description

Minimal Elixir project that demonstrates decoupling and separation of concerns. Inside the umbrella, there are three apps that expose their business logic via Phoenix contexts.

### 1. `PlaygroundDb` persists data

```elixir
iex> PlaygroundDb.Posts.list_posts()

[
  %PlaygroundDb.Posts.Post{
    comments: [
      %PlaygroundDb.Posts.Comments.Comment{
        content: "First comment",
      }
    ],
    content: "First post",
  },
  %PlaygroundDb.Posts.Post{
    comments: [],
    content: "Second post",
  },
  # etc...
]

```

### 2. `PlaygroundApi` serves the data via JSON:API

<img width="606" alt="Step 2" src="https://user-images.githubusercontent.com/1413569/49207452-8938dc00-f3e7-11e8-91d4-95549a322d1d.png">

### 3. `PlaygroundWeb` is a REST client with UI

<img width="606" alt="Step 3" src="https://user-images.githubusercontent.com/1413569/49207750-6d820580-f3e8-11e8-8dcb-722b7259a9dc.png">

## Requirements

* Phoenix 1.4.0 or later
* Elixir 1.7 or later
* Erlang 21 or later

## Installation

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Change to Phoenix directory with `cd apps/playground_web`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

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

## License

See [LICENSE](LICENSE).
