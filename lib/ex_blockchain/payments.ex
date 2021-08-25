defmodule ExBlockchain.Payments do
  @type t :: %__MODULE__{
          receiving_address: ExBlockchain.ReceivingAddress.t() | nil
        }
  defstruct [:receiving_address]
end
