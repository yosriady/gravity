defmodule Gravity.Hash do
  @moduledoc """
    All URLs on Gravatar are based on the use of the hashed value of an email address.
    Images and profiles are both accessed via the hash of an email,
    and it is considered the primary way of identifying an identity within the system.

    iex> Gravity.Hash.build("MyEmailAddress@example.com")
    "0bc83cb571cd1c50ba6f3e8a78ef1346"
  """

  alias Gravity.Crypto

  @spec build(String.t) :: String.t
  def build(email) do
    email
    |> String.trim
    |> String.downcase
    |> Crypto.md5
  end
end
