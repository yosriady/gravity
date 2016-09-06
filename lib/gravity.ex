defmodule Gravity do
  @moduledoc """

    Elixir client for the gravatar API. See types for possible option values.

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

  """

  alias Gravity.Hash
  alias Gravity.Config

  @type email :: String.t
  @type url :: String.t

  @type image_options :: list(image_option_item)
  @type image_option_item :: {size_key, size_value} | {default_key, default_value} | {rating_key, rating_value}
  @type size_key :: :s | :size
  @type size_value :: 1..2048
  @type default_key :: :d | :default
  @type default_value :: :"404" | :mm | :identicon | :monsterid | :wavatar | :retro | :blank | url
  @type rating_key :: :r | :rating
  @type rating_value :: :g | :pg | :r | :x
  @type profile_format :: :"" | :json | :xml | :php | :vcf | :qr

  @spec image(email, image_options) :: url
  def image(email, opts \\ []) do
    hash = Hash.build(email)
    params = "?#{URI.encode_query(opts)}"
    nonempty_params? = (String.length(params) > 1)

    "#{Config.protocol}://www.gravatar.com/avatar/#{hash}#{if nonempty_params?, do: params}"
  end

  @spec profile(email, profile_format) :: url
  def profile(email, format \\ :"") do
    hash = Hash.build(email)
    format_string = Atom.to_string(format)
    nonempty_format? = (String.length(format_string) > 1)

    "#{Config.protocol}://www.gravatar.com/#{hash}#{if nonempty_format?, do: "." <> format_string}"
  end
end
