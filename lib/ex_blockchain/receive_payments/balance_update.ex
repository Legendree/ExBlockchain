defmodule ExBlockchain.BalanceUpdate do
  alias ExBlockchain.{Request, Api}

  @type t :: %__MODULE__{
          id: String.t() | iodata() | nil,
          addr: String.t() | iodata() | nil,
          op: String.t() | iodata() | nil,
          confs: integer() | nil,
          callback: String.t() | iodata() | nil,
          on_notification: String.t() | iodata() | nil
        }
  defstruct [:id, :addr, :op, :confs, :callback, :on_notification]

  def create(fields \\ []) do
    struct!(__MODULE__, fields)
  end

  defp initiate_request(fields) do
    Request.request(:post, "/receive/balance_update", [{"Content-Type", "text/plain"}], [])
  end
end
