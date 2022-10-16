defmodule ExHBase.Pb.Consistency do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :STRONG, 0
  field :TIMELINE, 1
end

defmodule ExHBase.Pb.MutationProto.Durability do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :USE_DEFAULT, 0
  field :SKIP_WAL, 1
  field :ASYNC_WAL, 2
  field :SYNC_WAL, 3
  field :FSYNC_WAL, 4
end

defmodule ExHBase.Pb.MutationProto.MutationType do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :APPEND, 0
  field :INCREMENT, 1
  field :PUT, 2
  field :DELETE, 3
end

defmodule ExHBase.Pb.MutationProto.DeleteType do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :DELETE_ONE_VERSION, 0
  field :DELETE_MULTIPLE_VERSIONS, 1
  field :DELETE_FAMILY, 2
  field :DELETE_FAMILY_VERSION, 3
end

defmodule ExHBase.Pb.Authorizations do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :label, 1, repeated: true, type: :string
end

defmodule ExHBase.Pb.CellVisibility do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :expression, 1, required: true, type: :string
end

defmodule ExHBase.Pb.Column do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :family, 1, required: true, type: :bytes
  field :qualifier, 2, repeated: true, type: :bytes
end

defmodule ExHBase.Pb.Get do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :row, 1, required: true, type: :bytes
  field :column, 2, repeated: true, type: ExHBase.Pb.Column
  field :attribute, 3, repeated: true, type: ExHBase.Pb.NameBytesPair
  field :filter, 4, optional: true, type: ExHBase.Pb.Filter
  field :time_range, 5, optional: true, type: ExHBase.Pb.TimeRange
  field :max_versions, 6, optional: true, type: :uint32, default: 1
  field :cache_blocks, 7, optional: true, type: :bool, default: true
  field :store_limit, 8, optional: true, type: :uint32
  field :store_offset, 9, optional: true, type: :uint32
  field :existence_only, 10, optional: true, type: :bool, default: false
  field :closest_row_before, 11, optional: true, type: :bool, default: false

  field :consistency, 12,
    optional: true,
    type: ExHBase.Pb.Consistency,
    default: :STRONG,
    enum: true

  field :cf_time_range, 13, repeated: true, type: ExHBase.Pb.ColumnFamilyTimeRange
end

defmodule ExHBase.Pb.Result do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :cell, 1, repeated: true, type: ExHBase.Pb.Cell
  field :associated_cell_count, 2, optional: true, type: :int32
  field :exists, 3, optional: true, type: :bool
  field :stale, 4, optional: true, type: :bool, default: false
  field :partial, 5, optional: true, type: :bool, default: false
end

defmodule ExHBase.Pb.GetRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :region, 1, required: true, type: ExHBase.Pb.RegionSpecifier
  field :get, 2, required: true, type: ExHBase.Pb.Get
end

defmodule ExHBase.Pb.GetResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :result, 1, optional: true, type: ExHBase.Pb.Result
end

defmodule ExHBase.Pb.Condition do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :row, 1, required: true, type: :bytes
  field :family, 2, required: true, type: :bytes
  field :qualifier, 3, required: true, type: :bytes
  field :compare_type, 4, required: true, type: ExHBase.Pb.CompareType, enum: true
  field :comparator, 5, required: true, type: ExHBase.Pb.Comparator
end

defmodule ExHBase.Pb.MutationProto.ColumnValue.QualifierValue do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :qualifier, 1, optional: true, type: :bytes
  field :value, 2, optional: true, type: :bytes
  field :timestamp, 3, optional: true, type: :uint64
  field :delete_type, 4, optional: true, type: ExHBase.Pb.MutationProto.DeleteType, enum: true
  field :tags, 5, optional: true, type: :bytes
end

defmodule ExHBase.Pb.MutationProto.ColumnValue do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :family, 1, required: true, type: :bytes

  field :qualifier_value, 2,
    repeated: true,
    type: ExHBase.Pb.MutationProto.ColumnValue.QualifierValue
end

defmodule ExHBase.Pb.MutationProto do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :row, 1, optional: true, type: :bytes
  field :mutate_type, 2, optional: true, type: ExHBase.Pb.MutationProto.MutationType, enum: true
  field :column_value, 3, repeated: true, type: ExHBase.Pb.MutationProto.ColumnValue
  field :timestamp, 4, optional: true, type: :uint64
  field :attribute, 5, repeated: true, type: ExHBase.Pb.NameBytesPair

  field :durability, 6,
    optional: true,
    type: ExHBase.Pb.MutationProto.Durability,
    default: :USE_DEFAULT,
    enum: true

  field :time_range, 7, optional: true, type: ExHBase.Pb.TimeRange
  field :associated_cell_count, 8, optional: true, type: :int32
  field :nonce, 9, optional: true, type: :uint64
end

defmodule ExHBase.Pb.MutateRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :region, 1, required: true, type: ExHBase.Pb.RegionSpecifier
  field :mutation, 2, required: true, type: ExHBase.Pb.MutationProto
  field :condition, 3, optional: true, type: ExHBase.Pb.Condition
  field :nonce_group, 4, optional: true, type: :uint64
end

defmodule ExHBase.Pb.MutateResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :result, 1, optional: true, type: ExHBase.Pb.Result
  field :processed, 2, optional: true, type: :bool
end

defmodule ExHBase.Pb.Scan do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :column, 1, repeated: true, type: ExHBase.Pb.Column
  field :attribute, 2, repeated: true, type: ExHBase.Pb.NameBytesPair
  field :start_row, 3, optional: true, type: :bytes
  field :stop_row, 4, optional: true, type: :bytes
  field :filter, 5, optional: true, type: ExHBase.Pb.Filter
  field :time_range, 6, optional: true, type: ExHBase.Pb.TimeRange
  field :max_versions, 7, optional: true, type: :uint32, default: 1
  field :cache_blocks, 8, optional: true, type: :bool, default: true
  field :batch_size, 9, optional: true, type: :uint32
  field :max_result_size, 10, optional: true, type: :uint64
  field :store_limit, 11, optional: true, type: :uint32
  field :store_offset, 12, optional: true, type: :uint32
  field :load_column_families_on_demand, 13, optional: true, type: :bool
  field :small, 14, optional: true, type: :bool
  field :reversed, 15, optional: true, type: :bool, default: false

  field :consistency, 16,
    optional: true,
    type: ExHBase.Pb.Consistency,
    default: :STRONG,
    enum: true

  field :caching, 17, optional: true, type: :uint32
  field :allow_partial_results, 18, optional: true, type: :bool
  field :cf_time_range, 19, repeated: true, type: ExHBase.Pb.ColumnFamilyTimeRange
end

defmodule ExHBase.Pb.ScanRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :region, 1, optional: true, type: ExHBase.Pb.RegionSpecifier
  field :scan, 2, optional: true, type: ExHBase.Pb.Scan
  field :scanner_id, 3, optional: true, type: :uint64
  field :number_of_rows, 4, optional: true, type: :uint32
  field :close_scanner, 5, optional: true, type: :bool
  field :next_call_seq, 6, optional: true, type: :uint64
  field :client_handles_partials, 7, optional: true, type: :bool
  field :client_handles_heartbeats, 8, optional: true, type: :bool
  field :track_scan_metrics, 9, optional: true, type: :bool
  field :renew, 10, optional: true, type: :bool, default: false
end

defmodule ExHBase.Pb.ScanResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :cells_per_result, 1, repeated: true, type: :uint32
  field :scanner_id, 2, optional: true, type: :uint64
  field :more_results, 3, optional: true, type: :bool
  field :ttl, 4, optional: true, type: :uint32
  field :results, 5, repeated: true, type: ExHBase.Pb.Result
  field :stale, 6, optional: true, type: :bool
  field :partial_flag_per_result, 7, repeated: true, type: :bool
  field :more_results_in_region, 8, optional: true, type: :bool
  field :heartbeat_message, 9, optional: true, type: :bool
end

defmodule ExHBase.Pb.BulkLoadHFileRequest.FamilyPath do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :family, 1, required: true, type: :bytes
  field :path, 2, required: true, type: :string
end

defmodule ExHBase.Pb.BulkLoadHFileRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :region, 1, required: true, type: ExHBase.Pb.RegionSpecifier
  field :family_path, 2, repeated: true, type: ExHBase.Pb.BulkLoadHFileRequest.FamilyPath
  field :assign_seq_num, 3, optional: true, type: :bool
end

defmodule ExHBase.Pb.BulkLoadHFileResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :loaded, 1, required: true, type: :bool
end

defmodule ExHBase.Pb.CoprocessorServiceCall do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :row, 1, required: true, type: :bytes
  field :service_name, 2, required: true, type: :string
  field :method_name, 3, required: true, type: :string
  field :request, 4, required: true, type: :bytes
end

defmodule ExHBase.Pb.CoprocessorServiceResult do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :value, 1, optional: true, type: ExHBase.Pb.NameBytesPair
end

defmodule ExHBase.Pb.CoprocessorServiceRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :region, 1, required: true, type: ExHBase.Pb.RegionSpecifier
  field :call, 2, required: true, type: ExHBase.Pb.CoprocessorServiceCall
end

defmodule ExHBase.Pb.CoprocessorServiceResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :region, 1, required: true, type: ExHBase.Pb.RegionSpecifier
  field :value, 2, required: true, type: ExHBase.Pb.NameBytesPair
end

defmodule ExHBase.Pb.Action do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :index, 1, optional: true, type: :uint32
  field :mutation, 2, optional: true, type: ExHBase.Pb.MutationProto
  field :get, 3, optional: true, type: ExHBase.Pb.Get
  field :service_call, 4, optional: true, type: ExHBase.Pb.CoprocessorServiceCall
end

defmodule ExHBase.Pb.RegionAction do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :region, 1, required: true, type: ExHBase.Pb.RegionSpecifier
  field :atomic, 2, optional: true, type: :bool
  field :action, 3, repeated: true, type: ExHBase.Pb.Action
end

defmodule ExHBase.Pb.RegionLoadStats do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :memstoreLoad, 1, optional: true, type: :int32, default: 0
  field :heapOccupancy, 2, optional: true, type: :int32, default: 0
  field :compactionPressure, 3, optional: true, type: :int32, default: 0
end

defmodule ExHBase.Pb.MultiRegionLoadStats do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :region, 1, repeated: true, type: ExHBase.Pb.RegionSpecifier
  field :stat, 2, repeated: true, type: ExHBase.Pb.RegionLoadStats
end

defmodule ExHBase.Pb.ResultOrException do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :index, 1, optional: true, type: :uint32
  field :result, 2, optional: true, type: ExHBase.Pb.Result
  field :exception, 3, optional: true, type: ExHBase.Pb.NameBytesPair
  field :service_result, 4, optional: true, type: ExHBase.Pb.CoprocessorServiceResult
  field :loadStats, 5, optional: true, type: ExHBase.Pb.RegionLoadStats, deprecated: true
end

defmodule ExHBase.Pb.RegionActionResult do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :resultOrException, 1, repeated: true, type: ExHBase.Pb.ResultOrException
  field :exception, 2, optional: true, type: ExHBase.Pb.NameBytesPair
end

defmodule ExHBase.Pb.MultiRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :regionAction, 1, repeated: true, type: ExHBase.Pb.RegionAction
  field :nonceGroup, 2, optional: true, type: :uint64
  field :condition, 3, optional: true, type: ExHBase.Pb.Condition
end

defmodule ExHBase.Pb.MultiResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :regionActionResult, 1, repeated: true, type: ExHBase.Pb.RegionActionResult
  field :processed, 2, optional: true, type: :bool
  field :regionStatistics, 3, optional: true, type: ExHBase.Pb.MultiRegionLoadStats
end