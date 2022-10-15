defmodule ExHBase do
  @moduledoc """
  Documentation for `ExHBase`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ExHBase.hello()
      :world

  """
  def hello do
    :world
  end

  def connect() do
    {:ok, pid} = :erlzk.connect([{'127.0.0.1', 2181}], 30000)
    {:ok, {data, _}} = :erlzk.get_data(pid, '/hbase/meta-region-server')
    :ok = :erlzk.close(pid)

    meta_location =
      data
      |> decode_zk_node()
      |> Pb.MetaRegionServer.decode()
  end

  def decode_zk_node(data) do
    # The format is like this
    # 1 byte of magic number. 255
    # 4 bytes of id length.
    # id_length number of bytes for the id of who put up the znode
    # 4 bytes of a magic string PBUF
    # Then the protobuf serialized without a varint header.

    <<255, id_len_buf::binary-size(4), rest::binary>> = data
    id_len = :binary.decode_unsigned(id_len_buf)
    <<_id::binary-size(id_len), "PBUF", pb::binary>> = rest

    pb
  end
end
