defmodule ExBlockchain.ReceivePayments do
  alias ExBlockchain.{ReceivingAddress, BalanceUpdate}

  @type t :: %__MODULE__{
          receiving_address: ExBlockchain.ReceivingAddress.t() | nil
        }
  defstruct [:receiving_address]

  @doc """
  Generating a Receiving Address [GET]
  Provide unique, unused bitcoin addresses to your customers
  """
  @spec generate_receive_address(number()) :: ExBlockchain.ReceivingAddress.t()
  def generate_receive_address(invoice_id) do
    ReceivingAddress.generate(invoice_id)
  end

  def request_balance_updates(fields) do
    BalanceUpdate.create(fields)
  end
end
