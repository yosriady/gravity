defmodule Gravity.Crypto do
  @moduledoc false

  @spec md5(String.t) :: String.t
  def md5(str) do
    str
    |> (fn(s) -> :erlang.md5(s) end).()
    |> Base.encode16(case: :lower)
  end
end
