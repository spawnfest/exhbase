defmodule VarintDecoders do
  import Protobuf.Wire.Varint

  def decode(<<bin::bits>>), do: decode_varints(bin)

  defdecoderp decode_varints() do
    {value, rest}
  end
end
