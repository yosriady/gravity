# Gravity

Elixir client for the Gravatar API.

## Installation

Add gravity to your list of dependencies in `mix.exs`:

```
        def deps do
          [{:gravity, "~> 0.0.1"}]
        end
```

## Usage

```
    iex> Gravity.image("yosriady@gmail.com")
    "https://www.gravatar.com/avatar/1b0ab2500efc1b91424fb49045312929"

    iex> Gravity.image("yosriady@gmail.com", size: 200, rating: :pg, default: :retro)
    "https://www.gravatar.com/avatar/1b0ab2500efc1b91424fb49045312929?size=200&rating=pg&default=retro"

    iex> Gravity.image("yosriady@gmail.com", s: 200, r: :pg, d: :retro)
    "https://www.gravatar.com/avatar/1b0ab2500efc1b91424fb49045312929?s=200&r=pg&d=retro"

    iex> Gravity.profile("yosriady@gmail.com")
    "https://www.gravatar.com/1b0ab2500efc1b91424fb49045312929"

    iex>Gravity.profile("yosriady@gmail.com", :qr)
    "https://www.gravatar.com/1b0ab2500efc1b91424fb49045312929.qr"
```

## Configuration

In your `mix.exs`:

```
config :gravity,
        secure: false # true by default (https), set it to false to use http

```
