defmodule Indexer.Transform.Blocks.Base do
  @moduledoc """
  Default block transformer to be used.
  """

  alias Indexer.Transform.Blocks

  @behaviour Blocks

  @impl Blocks
  def transform(block) when is_map(block) do
    Map.put(block, :miner_hash, String.downcase(block[:miner_hash]))
  end
end
