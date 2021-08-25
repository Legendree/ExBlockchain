defmodule ExBlockchain.ReceivingAddress do
  alias ExBlockchain.ReceivingAddress

  defstruct ~w(address index callback)a

  def new(attrs \\ []) do
    struct!(ReceivingAddress, attrs)
  end

  def initiate(invoice_id) do
    ExBlockchain.Request.request(:get, ExBlockchain.Api.get_pubx_url(invoice_id))
  end
end
