defmodule ExBlockchain.Api do
  alias ExBlockchain.{Config}

  @api_version "2021-08-25"
  @pool_name __MODULE__

  @spec get_default_api_key() :: String.t()
  defp get_default_api_key() do
    # If no API key provided, will raise issues with the Blockchain API
    Config.resolve(:api_key, "")
  end

  @spec get_default_xpub_key() :: String.t()
  def get_default_xpub_key() do
    # If no xPub key provided, will raise issues with the Blockchain API
    Config.resolve(:xpub_key, "")
  end

  @spec get_api_version() :: String.t()
  defp get_api_version() do
    Config.resolve(:api_version, @api_version)
  end
end
