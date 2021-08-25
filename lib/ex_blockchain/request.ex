defmodule ExBlockchain.Request do
  @type headers :: [{String.t(), String.t()}]
  @type method :: :get | :post | :delete | :put
  @typep success_response ::
           {:ok, integer(), [{String.t(), String.t()}], String.t()}
  @typep failure_response :: {:error, term()}

  @spec request(method(), String.t(), headers(), String.t(), list()) ::
          success_response() | failure_response()
  def request(method, url, headers, payload, options)
      when method in [:get, :post, :delete, :put] do
    {:ok, _, _, _} = :hackney.request(method, url, headers, payload, options)
  end

  @spec request(method(), String.t(), headers()) :: success_response() | failure_response()
  def request(method, url, headers) when method in [:get, :post, :delete, :put] do
    request(method, url, headers, "", [])
  end

  @spec request(method(), String.t()) :: success_response() | failure_response()
  def request(method, url) when method in [:get, :post, :delete, :put] do
    request(method, url, [], "", [])
  end
end
