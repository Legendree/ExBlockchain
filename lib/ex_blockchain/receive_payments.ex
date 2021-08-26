defmodule ExBlockchain.ReceivePayments do
  alias ExBlockchain.{ReceivingAddress}

  @type t :: %__MODULE__{
          receiving_address: ExBlockchain.ReceivingAddress.t() | nil
        }
  defstruct [:receiving_address]

  @doc """
  Generating a Receiving Address [GET
  Provide unique, unused bitcoin addresses to your customers
  """
  def receive_address(invoice_id) do
    ReceivingAddress.create(invoice_id)
  end
end
