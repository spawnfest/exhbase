defmodule ExHBase.Pb.RPCTInfo.HeadersEntry do
  @moduledoc false
  use Protobuf, map: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: :string
end

defmodule ExHBase.Pb.RPCTInfo do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :trace_id, 1, optional: true, type: :int64, deprecated: true
  field :parent_id, 2, optional: true, type: :int64, deprecated: true
  field :headers, 3, repeated: true, type: ExHBase.Pb.RPCTInfo.HeadersEntry, map: true
end