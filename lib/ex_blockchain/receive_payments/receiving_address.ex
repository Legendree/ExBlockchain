defmodule ExBlockchain.ReceivingAddress do
  alias ExBlockchain.{Request, Api}

  @type t :: %__MODULE__{
          address: String.t() | nil,
          index: integer() | nil,
          callback: String.t() | iodata() | nil,
          description: String.t() | iodata() | nil,
          message: String.t() | iodata() | nil
        }
  defstruct [:address, :index, :callback, :description, :message]

  @spec generate(number()) :: __MODULE__.t()
  def generate(invoice_id) do
    fields =
      Request.request(:get, Api.build_receiving_address_url(invoice_id)) |> Api.convert_to_klist()

    struct!(__MODULE__, fields)
  end
end
