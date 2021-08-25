defmodule ExBlockchain.Config do
  @moduledoc """
  Utility that handles interaction with the application's configuration
  """

  @doc """
    Resolves the given key from the application's configuration returning the
  wrapped expanded value. If the value was a function it get's evaluated, if
  the value is a touple of three elements it gets applied.
  """

  @spec resolve(atom(), any()) :: any()
  def resolve(key, default \\ nil)

  def resolve(key, default) when is_atom(key) do
    Application.get_env(:ex_blockchain, key, default) |> expand_value()
  end

  def resolve(key, _) do
    raise(ArgumentError, "#{__MODULE__} expected '#{key}' to be an atom")
  end

  @spec expand_value(tuple()) :: term()
  defp expand_value({module, function, args}) when is_atom(function) and is_list(args) do
    apply(module, function, args)
  end

  @spec expand_value(function()) :: term()
  defp expand_value(value) when is_function(value) do
    value.()
  end

  @spec expand_value(term()) :: term()
  defp expand_value(value), do: value
end
