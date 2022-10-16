defmodule ExHBase.Pb.UserInformation do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :effective_user, 1, required: true, type: :string
  field :real_user, 2, optional: true, type: :string
end

defmodule ExHBase.Pb.ConnectionHeader do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :user_info, 1, optional: true, type: ExHBase.Pb.UserInformation
  field :service_name, 2, optional: true, type: :string
  field :cell_block_codec_class, 3, optional: true, type: :string
  field :cell_block_compressor_class, 4, optional: true, type: :string
  field :version_info, 5, optional: true, type: ExHBase.Pb.VersionInfo
end

defmodule ExHBase.Pb.CellBlockMeta do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :length, 1, optional: true, type: :uint32
end

defmodule ExHBase.Pb.ExceptionResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :exception_class_name, 1, optional: true, type: :string
  field :stack_trace, 2, optional: true, type: :string
  field :hostname, 3, optional: true, type: :string
  field :port, 4, optional: true, type: :int32
  field :do_not_retry, 5, optional: true, type: :bool
end

defmodule ExHBase.Pb.RequestHeader do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :call_id, 1, optional: true, type: :uint32
  field :trace_info, 2, optional: true, type: ExHBase.Pb.RPCTInfo
  field :method_name, 3, optional: true, type: :string
  field :request_param, 4, optional: true, type: :bool
  field :cell_block_meta, 5, optional: true, type: ExHBase.Pb.CellBlockMeta
  field :priority, 6, optional: true, type: :uint32
  field :timeout, 7, optional: true, type: :uint32
end

defmodule ExHBase.Pb.ResponseHeader do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :call_id, 1, optional: true, type: :uint32
  field :exception, 2, optional: true, type: ExHBase.Pb.ExceptionResponse
  field :cell_block_meta, 3, optional: true, type: ExHBase.Pb.CellBlockMeta
end