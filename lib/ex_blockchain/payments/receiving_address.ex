defmodule ExBlockchain.ReceivingAddress do
  @type t :: %__MODULE__{
          address: String.t() | nil,
          index: integer() | nil,
          callback: String.t() | iodata() | nil
        }
  defstruct [:address, :index, :callback]
end
