defmodule Gravity.Config do
  @moduledoc """
    Default configuration values for gravity.
  """

  def protocol do
    use_https? = Application.get_env(:gravity, :secure, default: true)
    if use_https? do
      "https"
    else
      "http"
    end
  end
end
