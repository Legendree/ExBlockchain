defmodule ExBlockchain.Api do
  alias ExBlockchain.{Config}

  @api_version "2021-08-25"

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

  def get_default_domain() do
  end

  @spec get_api_version() :: String.t()
  defp get_api_version() do
    Config.resolve(:api_version, @api_version)
  end

  defp get_default_secret() do
    Config.resolve(:secret, "")
  end

  def get_pubx_url(invoice_id) do
    encoded_callback_uri =
      URI.encode(
        "https://#{get_default_domain()}?invoice_id=#{invoice_id}",
        &encodable_characters/1
      )

    "https://api.blockchain.info/v2/receive?xpub=#{get_default_xpub_key()}&callback=#{encoded_callback_uri}&key=#{get_default_api_key()}"
  end

  defp encodable_characters(byte) do
    byte != ?/ && byte != ?: && byte != ?? && byte != ?=
  end
end
