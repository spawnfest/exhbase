defmodule Pb.SplitLogTask.State do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :UNASSIGNED, 0
  field :OWNED, 1
  field :RESIGNED, 2
  field :DONE, 3
  field :ERR, 4
end

defmodule Pb.SplitLogTask.RecoveryMode do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :UNKNOWN, 0
  field :LOG_SPLITTING, 1
  field :LOG_REPLAY, 2
end

defmodule Pb.Table.State do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :ENABLED, 0
  field :DISABLED, 1
  field :DISABLING, 2
  field :ENABLING, 3
end

defmodule Pb.ReplicationState.State do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :ENABLED, 0
  field :DISABLED, 1
end

defmodule Pb.MetaRegionServer do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :server, 1, required: true, type: Pb.ServerName
  field :rpc_version, 2, optional: true, type: :uint32
  field :state, 3, optional: true, type: Pb.RegionState.State, enum: true
end

defmodule Pb.Master do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :master, 1, required: true, type: Pb.ServerName
  field :rpc_version, 2, optional: true, type: :uint32
  field :info_port, 3, optional: true, type: :uint32
end

defmodule Pb.ClusterUp do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :start_date, 1, required: true, type: :string
end

defmodule Pb.RegionTransition do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :event_type_code, 1, required: true, type: :uint32
  field :region_name, 2, required: true, type: :bytes
  field :create_time, 3, required: true, type: :uint64
  field :server_name, 4, required: true, type: Pb.ServerName
  field :payload, 5, optional: true, type: :bytes
end

defmodule Pb.SplitLogTask do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :state, 1, required: true, type: Pb.SplitLogTask.State, enum: true
  field :server_name, 2, required: true, type: Pb.ServerName

  field :mode, 3,
    optional: true,
    type: Pb.SplitLogTask.RecoveryMode,
    default: :UNKNOWN,
    enum: true
end

defmodule Pb.Table do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :state, 1, required: true, type: Pb.Table.State, default: :ENABLED, enum: true
end

defmodule Pb.ReplicationPeer do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :clusterkey, 1, required: true, type: :string
  field :replicationEndpointImpl, 2, optional: true, type: :string
  field :data, 3, repeated: true, type: Pb.BytesBytesPair
  field :configuration, 4, repeated: true, type: Pb.NameStringPair
end

defmodule Pb.ReplicationState do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :state, 1, required: true, type: Pb.ReplicationState.State, enum: true
end

defmodule Pb.ReplicationHLogPosition do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :position, 1, required: true, type: :int64
end

defmodule Pb.ReplicationLock do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :lock_owner, 1, required: true, type: :string
end

defmodule Pb.TableLock do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :table_name, 1, optional: true, type: Pb.TableName
  field :lock_owner, 2, optional: true, type: Pb.ServerName
  field :thread_id, 3, optional: true, type: :int64
  field :is_shared, 4, optional: true, type: :bool
  field :purpose, 5, optional: true, type: :string
  field :create_time, 6, optional: true, type: :int64
end

defmodule Pb.SwitchState do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :enabled, 1, optional: true, type: :bool
end