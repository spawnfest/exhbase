defmodule ExHBase.Pb.SplitLogTask.State do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :UNASSIGNED, 0
  field :OWNED, 1
  field :RESIGNED, 2
  field :DONE, 3
  field :ERR, 4
end

defmodule ExHBase.Pb.SplitLogTask.RecoveryMode do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :UNKNOWN, 0
  field :LOG_SPLITTING, 1
  field :LOG_REPLAY, 2
end

defmodule ExHBase.Pb.Table.State do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :ENABLED, 0
  field :DISABLED, 1
  field :DISABLING, 2
  field :ENABLING, 3
end

defmodule ExHBase.Pb.ReplicationState.State do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :ENABLED, 0
  field :DISABLED, 1
end

defmodule ExHBase.Pb.MetaRegionServer do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :server, 1, required: true, type: ExHBase.Pb.ServerName
  field :rpc_version, 2, optional: true, type: :uint32
  field :state, 3, optional: true, type: ExHBase.Pb.RegionState.State, enum: true
end

defmodule ExHBase.Pb.Master do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :master, 1, required: true, type: ExHBase.Pb.ServerName
  field :rpc_version, 2, optional: true, type: :uint32
  field :info_port, 3, optional: true, type: :uint32
end

defmodule ExHBase.Pb.ClusterUp do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :start_date, 1, required: true, type: :string
end

defmodule ExHBase.Pb.RegionTransition do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :event_type_code, 1, required: true, type: :uint32
  field :region_name, 2, required: true, type: :bytes
  field :create_time, 3, required: true, type: :uint64
  field :server_name, 4, required: true, type: ExHBase.Pb.ServerName
  field :payload, 5, optional: true, type: :bytes
end

defmodule ExHBase.Pb.SplitLogTask do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :state, 1, required: true, type: ExHBase.Pb.SplitLogTask.State, enum: true
  field :server_name, 2, required: true, type: ExHBase.Pb.ServerName

  field :mode, 3,
    optional: true,
    type: ExHBase.Pb.SplitLogTask.RecoveryMode,
    default: :UNKNOWN,
    enum: true
end

defmodule ExHBase.Pb.Table do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :state, 1, required: true, type: ExHBase.Pb.Table.State, default: :ENABLED, enum: true
end

defmodule ExHBase.Pb.ReplicationPeer do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :clusterkey, 1, required: true, type: :string
  field :replicationEndpointImpl, 2, optional: true, type: :string
  field :data, 3, repeated: true, type: ExHBase.Pb.BytesBytesPair
  field :configuration, 4, repeated: true, type: ExHBase.Pb.NameStringPair
end

defmodule ExHBase.Pb.ReplicationState do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :state, 1, required: true, type: ExHBase.Pb.ReplicationState.State, enum: true
end

defmodule ExHBase.Pb.ReplicationHLogPosition do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :position, 1, required: true, type: :int64
end

defmodule ExHBase.Pb.ReplicationLock do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :lock_owner, 1, required: true, type: :string
end

defmodule ExHBase.Pb.TableLock do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :table_name, 1, optional: true, type: ExHBase.Pb.TableName
  field :lock_owner, 2, optional: true, type: ExHBase.Pb.ServerName
  field :thread_id, 3, optional: true, type: :int64
  field :is_shared, 4, optional: true, type: :bool
  field :purpose, 5, optional: true, type: :string
  field :create_time, 6, optional: true, type: :int64
end

defmodule ExHBase.Pb.SwitchState do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :enabled, 1, optional: true, type: :bool
end