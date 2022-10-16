defmodule ExHBase.Pb.RegionState.State do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :OFFLINE, 0
  field :PENDING_OPEN, 1
  field :OPENING, 2
  field :OPEN, 3
  field :PENDING_CLOSE, 4
  field :CLOSING, 5
  field :CLOSED, 6
  field :SPLITTING, 7
  field :SPLIT, 8
  field :FAILED_OPEN, 9
  field :FAILED_CLOSE, 10
  field :MERGING, 11
  field :MERGED, 12
  field :SPLITTING_NEW, 13
  field :MERGING_NEW, 14
end

defmodule ExHBase.Pb.RegionState do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :region_info, 1, required: true, type: ExHBase.Pb.RegionInfo
  field :state, 2, required: true, type: ExHBase.Pb.RegionState.State, enum: true
  field :stamp, 3, optional: true, type: :uint64
end

defmodule ExHBase.Pb.RegionInTransition do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :spec, 1, required: true, type: ExHBase.Pb.RegionSpecifier
  field :region_state, 2, required: true, type: ExHBase.Pb.RegionState
end

defmodule ExHBase.Pb.StoreSequenceId do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :family_name, 1, required: true, type: :bytes
  field :sequence_id, 2, required: true, type: :uint64
end

defmodule ExHBase.Pb.RegionStoreSequenceIds do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :last_flushed_sequence_id, 1, required: true, type: :uint64
  field :store_sequence_id, 2, repeated: true, type: ExHBase.Pb.StoreSequenceId
end

defmodule ExHBase.Pb.RegionLoad do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :region_specifier, 1, required: true, type: ExHBase.Pb.RegionSpecifier
  field :stores, 2, optional: true, type: :uint32
  field :storefiles, 3, optional: true, type: :uint32
  field :store_uncompressed_size_MB, 4, optional: true, type: :uint32
  field :storefile_size_MB, 5, optional: true, type: :uint32
  field :memstore_size_MB, 6, optional: true, type: :uint32
  field :storefile_index_size_MB, 7, optional: true, type: :uint32
  field :read_requests_count, 8, optional: true, type: :uint64
  field :write_requests_count, 9, optional: true, type: :uint64
  field :total_compacting_KVs, 10, optional: true, type: :uint64
  field :current_compacted_KVs, 11, optional: true, type: :uint64
  field :root_index_size_KB, 12, optional: true, type: :uint32
  field :total_static_index_size_KB, 13, optional: true, type: :uint32
  field :total_static_bloom_size_KB, 14, optional: true, type: :uint32
  field :complete_sequence_id, 15, optional: true, type: :uint64
  field :data_locality, 16, optional: true, type: :float
  field :last_major_compaction_ts, 17, optional: true, type: :uint64, default: 0
  field :store_complete_sequence_id, 18, repeated: true, type: ExHBase.Pb.StoreSequenceId
end

defmodule ExHBase.Pb.ReplicationLoadSink do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :ageOfLastAppliedOp, 1, required: true, type: :uint64
  field :timeStampsOfLastAppliedOp, 2, required: true, type: :uint64
end

defmodule ExHBase.Pb.ReplicationLoadSource do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :peerID, 1, required: true, type: :string
  field :ageOfLastShippedOp, 2, required: true, type: :uint64
  field :sizeOfLogQueue, 3, required: true, type: :uint32
  field :timeStampOfLastShippedOp, 4, required: true, type: :uint64
  field :replicationLag, 5, required: true, type: :uint64
end

defmodule ExHBase.Pb.ServerLoad do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :number_of_requests, 1, optional: true, type: :uint64
  field :total_number_of_requests, 2, optional: true, type: :uint64
  field :used_heap_MB, 3, optional: true, type: :uint32
  field :max_heap_MB, 4, optional: true, type: :uint32
  field :region_loads, 5, repeated: true, type: ExHBase.Pb.RegionLoad
  field :coprocessors, 6, repeated: true, type: ExHBase.Pb.Coprocessor
  field :report_start_time, 7, optional: true, type: :uint64
  field :report_end_time, 8, optional: true, type: :uint64
  field :info_server_port, 9, optional: true, type: :uint32
  field :replLoadSource, 10, repeated: true, type: ExHBase.Pb.ReplicationLoadSource
  field :replLoadSink, 11, optional: true, type: ExHBase.Pb.ReplicationLoadSink
end

defmodule ExHBase.Pb.LiveServerInfo do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :server, 1, required: true, type: ExHBase.Pb.ServerName
  field :server_load, 2, required: true, type: ExHBase.Pb.ServerLoad
end

defmodule ExHBase.Pb.ClusterStatus do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :hbase_version, 1, optional: true, type: ExHBase.Pb.HBaseVersionFileContent
  field :live_servers, 2, repeated: true, type: ExHBase.Pb.LiveServerInfo
  field :dead_servers, 3, repeated: true, type: ExHBase.Pb.ServerName
  field :regions_in_transition, 4, repeated: true, type: ExHBase.Pb.RegionInTransition
  field :cluster_id, 5, optional: true, type: ExHBase.Pb.ClusterId
  field :master_coprocessors, 6, repeated: true, type: ExHBase.Pb.Coprocessor
  field :master, 7, optional: true, type: ExHBase.Pb.ServerName
  field :backup_masters, 8, repeated: true, type: ExHBase.Pb.ServerName
  field :balancer_on, 9, optional: true, type: :bool
end