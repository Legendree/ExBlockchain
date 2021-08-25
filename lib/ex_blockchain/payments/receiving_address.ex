defmodule ExBlockchain.ReceivingAddress do
  alias ExBlockchain.ReceivingAddress

  defstruct ~w(address index callback)a

  def new(attrs \\ []) do
    struct!(ReceivingAddress, attrs)
  end
end
