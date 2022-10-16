defmodule ExHBase do
  @moduledoc """
  Documentation for `ExHBase`.
  """

  alias ExHBase.Pb

  @meta_region_name "hbase:meta,,1"
  @catalog_family "info"
  @server_column "server"
  @region_info_column "regioninfo"

  def locate_meta() do
    {:ok, pid} = :erlzk.connect([{'127.0.0.1', 2181}], 30000)
    {:ok, {data, _}} = :erlzk.get_data(pid, '/hbase/meta-region-server')
    :ok = :erlzk.close(pid)

    location =
      data
      |> decode_zk_node()
      |> Pb.MetaRegionServer.decode()

    {location.server.host_name, location.server.port}
  end

  def meta_region_info() do
    meta_table = Pb.TableName.new!(namespace: "hbase", qualifier: "meta")

    Pb.RegionInfo.new(
      start_key: "",
      end_key: "",
      offline: false,
      split: false,
      replica_id: 0,
      split: false,
      region_id: 1,
      table_name: meta_table
    )
  end

  def connect() do
    {:ok, socket} = :gen_tcp.connect('localhost', 16020, [:binary])
    :ok = :gen_tcp.send(socket, hello_request())

    socket
  end

  def decode_response(payload) do
    <<size::32, data::binary-size(size)>> = payload
    {header_len, header_and_rpc} = VarintDecoders.decode(data)
    <<header::binary-size(header_len), rpc::binary>> = header_and_rpc
    {Pb.ResponseHeader.decode(header), rpc}
  end

  def hello_request() do
    user_info = Pb.UserInformation.new!(effective_user: "root")

    conn_header =
      Pb.ConnectionHeader.new!(
        user_info: user_info,
        service_name: "ClientService",
        cell_block_codec_class: "org.apache.hadoop.hbase.codec.KeyValueCodec"
      )

    data = Protobuf.encode(conn_header)

    # \x50 = Simple Auth.
    header = "HBas\x00\x50"

    [header, <<byte_size(data)::32>>, data]
  end

  def meta_request(table_name, row) do
    region = Pb.RegionSpecifier.new!(type: :ENCODED_REGION_NAME, value: @meta_region_name)

    info_col =
      Pb.Column.new!(
        family: @catalog_family,
        qualifier: [@server_column, @region_info_column]
      )

    scan =
      Pb.Scan.new!(
        max_versions: 1,
        cache_blocks: true,
        small: true,
        reversed: true,
        allow_partial_results: false,
        column: [info_col],
        start_row: region_lookup_row_key(table_name, row)
      )

    Pb.ScanRequest.new!(
      region: region,
      scan: scan,
      number_of_rows: 1,
      close_scanner: true
    )
  end

  def region_lookup_row_key(table_name, row) do
    table_name <> "," <> row <> "," <> "999999999999999999"
  end

  def rpc_request(name, rpc) do
    header = Pb.RequestHeader.new!(call_id: 1, method_name: name, request_param: true)

    pb_header = Protobuf.encode(header)
    pb_request = Protobuf.encode(rpc)

    data = [
      Protobuf.Wire.Varint.encode(byte_size(pb_header)),
      pb_header,
      Protobuf.Wire.Varint.encode(byte_size(pb_request)),
      pb_request
    ]

    [<<:erlang.iolist_size(data)::32>>, data]
  end

  defp decode_zk_node(data) do
    # The format is like this
    # 1 byte of magic number. 255
    # 4 bytes of id length.
    # id_length number of bytes for the id of who put up the znode
    # 4 bytes of a magic string PBUF
    # Then the protobuf serialized without a varint header.

    <<255, id_len::32, rest::binary>> = data
    <<_id::binary-size(id_len), "PBUF", pb::binary>> = rest

    pb
  end

  # defp map ~>> [{k, v}], do: Map.replace!(map, k, v)
end
