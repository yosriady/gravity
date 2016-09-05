defmodule Gravity do
  @moduledoc """

    Elixir client for the gravatar API.

    iex> Gravity.image("yosriady@gmail.com")
    "https://www.gravatar.com/avatar/1b0ab2500efc1b91424fb49045312929"

    iex> Gravity.profile("beau@automattic.com")
    "https://www.gravatar.com/22bd03ace6f176bfe0c593650bcf45d8"

  """

  alias Gravity.Hash

  @spec image(String.t) :: String.t
  def image(email, opts \\ []) do
    hash = Hash.build(email)
    params = "?#{URI.encode_query(opts)}"
    nonempty_params? = (String.length(params) > 1)

    "https://www.gravatar.com/avatar/#{hash}#{if nonempty_params?, do: params}"
  end

  @spec profile(String.t, String.t) :: String.t
  def profile(email, format \\ "", opts \\ []) do
    hash = Hash.build(email)
    params = "?#{URI.encode_query(opts)}"
    nonempty_params? = (String.length(params) > 1)
    nonempty_format? = (String.length(format) > 1)

    "https://www.gravatar.com/#{hash}#{if nonempty_format?, do: "." <> format}#{if nonempty_params?, do: params}"
  end
end
