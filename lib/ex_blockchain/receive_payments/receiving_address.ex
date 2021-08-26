defmodule ExBlockchain.ReceivingAddress do
  alias ExBlockchain.{Request, Api}

  @type t :: %__MODULE__{
          address: String.t() | nil,
          index: integer() | nil,
          callback: String.t() | iodata() | nil
        }
  defstruct [:address, :index, :callback]

  def create(invoice_id) do
    fields = Request.request(:get, Api.build_pubx_url(invoice_id)) |> Api.convert_to_klist()
    struct!(__MODULE__, fields)
  end
end
