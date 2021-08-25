defmodule ExBlockchain.MixProject do
  use Mix.Project

  def project do
    [
      description: description(),
      app: :ex_blockchain,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      env: env(),
      mod: {ExBlockchain, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:hackney, "~> 1.17"},
      {:jason, "~> 1.2"}
    ]
  end

  defp env do
    [
      base_url: "https://api.blockchain.info/v2",
      pool_options: [timeout: 5_000, max_connections: 10],
      use_connection_pool: true
    ]
  end

  defp description do
    """
    A Blockchain payments client for Elixir.
    """
  end
end
