defmodule Constrictor.Action do
  @derive [Poison.Encoder]
  defstruct [
    url: nil,
    method: nil,
    type: nil,
    value: nil,
    request: nil,
    toGenerate: nil
    ]
end
