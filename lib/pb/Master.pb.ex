defmodule ExHBase.Pb.MasterSwitchType do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :SPLIT, 0
  field :MERGE, 1
end

defmodule ExHBase.Pb.GetProcedureResultResponse.State do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :NOT_FOUND, 0
  field :RUNNING, 1
  field :FINISHED, 2
end

defmodule ExHBase.Pb.SecurityCapabilitiesResponse.Capability do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :SIMPLE_AUTHENTICATION, 0
  field :SECURE_AUTHENTICATION, 1
  field :AUTHORIZATION, 2
  field :CELL_AUTHORIZATION, 3
  field :CELL_VISIBILITY, 4
end

defmodule ExHBase.Pb.AddColumnRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :table_name, 1, required: true, type: ExHBase.Pb.TableName
  field :column_families, 2, required: true, type: ExHBase.Pb.ColumnFamilySchema
  field :nonce_group, 3, optional: true, type: :uint64, default: 0
  field :nonce, 4, optional: true, type: :uint64, default: 0
end

defmodule ExHBase.Pb.AddColumnResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.DeleteColumnRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :table_name, 1, required: true, type: ExHBase.Pb.TableName
  field :column_name, 2, required: true, type: :bytes
  field :nonce_group, 3, optional: true, type: :uint64, default: 0
  field :nonce, 4, optional: true, type: :uint64, default: 0
end

defmodule ExHBase.Pb.DeleteColumnResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.ModifyColumnRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :table_name, 1, required: true, type: ExHBase.Pb.TableName
  field :column_families, 2, required: true, type: ExHBase.Pb.ColumnFamilySchema
  field :nonce_group, 3, optional: true, type: :uint64, default: 0
  field :nonce, 4, optional: true, type: :uint64, default: 0
end

defmodule ExHBase.Pb.ModifyColumnResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.MoveRegionRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :region, 1, required: true, type: ExHBase.Pb.RegionSpecifier
  field :dest_server_name, 2, optional: true, type: ExHBase.Pb.ServerName
end

defmodule ExHBase.Pb.MoveRegionResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.DispatchMergingRegionsRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :region_a, 1, required: true, type: ExHBase.Pb.RegionSpecifier
  field :region_b, 2, required: true, type: ExHBase.Pb.RegionSpecifier
  field :forcible, 3, optional: true, type: :bool, default: false
end

defmodule ExHBase.Pb.DispatchMergingRegionsResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.AssignRegionRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :region, 1, required: true, type: ExHBase.Pb.RegionSpecifier
end

defmodule ExHBase.Pb.AssignRegionResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.UnassignRegionRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :region, 1, required: true, type: ExHBase.Pb.RegionSpecifier
  field :force, 2, optional: true, type: :bool, default: false
end

defmodule ExHBase.Pb.UnassignRegionResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.OfflineRegionRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :region, 1, required: true, type: ExHBase.Pb.RegionSpecifier
end

defmodule ExHBase.Pb.OfflineRegionResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.CreateTableRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :table_schema, 1, required: true, type: ExHBase.Pb.TableSchema
  field :split_keys, 2, repeated: true, type: :bytes
  field :nonce_group, 3, optional: true, type: :uint64, default: 0
  field :nonce, 4, optional: true, type: :uint64, default: 0
end

defmodule ExHBase.Pb.CreateTableResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :proc_id, 1, optional: true, type: :uint64
end

defmodule ExHBase.Pb.DeleteTableRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :table_name, 1, required: true, type: ExHBase.Pb.TableName
  field :nonce_group, 2, optional: true, type: :uint64, default: 0
  field :nonce, 3, optional: true, type: :uint64, default: 0
end

defmodule ExHBase.Pb.DeleteTableResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :proc_id, 1, optional: true, type: :uint64
end

defmodule ExHBase.Pb.TruncateTableRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :tableName, 1, required: true, type: ExHBase.Pb.TableName
  field :preserveSplits, 2, optional: true, type: :bool, default: false
  field :nonce_group, 3, optional: true, type: :uint64, default: 0
  field :nonce, 4, optional: true, type: :uint64, default: 0
end

defmodule ExHBase.Pb.TruncateTableResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.EnableTableRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :table_name, 1, required: true, type: ExHBase.Pb.TableName
  field :nonce_group, 2, optional: true, type: :uint64, default: 0
  field :nonce, 3, optional: true, type: :uint64, default: 0
end

defmodule ExHBase.Pb.EnableTableResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :proc_id, 1, optional: true, type: :uint64
end

defmodule ExHBase.Pb.DisableTableRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :table_name, 1, required: true, type: ExHBase.Pb.TableName
  field :nonce_group, 2, optional: true, type: :uint64, default: 0
  field :nonce, 3, optional: true, type: :uint64, default: 0
end

defmodule ExHBase.Pb.DisableTableResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :proc_id, 1, optional: true, type: :uint64
end

defmodule ExHBase.Pb.ModifyTableRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :table_name, 1, required: true, type: ExHBase.Pb.TableName
  field :table_schema, 2, required: true, type: ExHBase.Pb.TableSchema
  field :nonce_group, 3, optional: true, type: :uint64, default: 0
  field :nonce, 4, optional: true, type: :uint64, default: 0
end

defmodule ExHBase.Pb.ModifyTableResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.CreateNamespaceRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :namespaceDescriptor, 1, required: true, type: ExHBase.Pb.NamespaceDescriptor
  field :nonce_group, 2, optional: true, type: :uint64, default: 0
  field :nonce, 3, optional: true, type: :uint64, default: 0
end

defmodule ExHBase.Pb.CreateNamespaceResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.DeleteNamespaceRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :namespaceName, 1, required: true, type: :string
  field :nonce_group, 2, optional: true, type: :uint64, default: 0
  field :nonce, 3, optional: true, type: :uint64, default: 0
end

defmodule ExHBase.Pb.DeleteNamespaceResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.ModifyNamespaceRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :namespaceDescriptor, 1, required: true, type: ExHBase.Pb.NamespaceDescriptor
  field :nonce_group, 2, optional: true, type: :uint64, default: 0
  field :nonce, 3, optional: true, type: :uint64, default: 0
end

defmodule ExHBase.Pb.ModifyNamespaceResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.GetNamespaceDescriptorRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :namespaceName, 1, required: true, type: :string
end

defmodule ExHBase.Pb.GetNamespaceDescriptorResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :namespaceDescriptor, 1, required: true, type: ExHBase.Pb.NamespaceDescriptor
end

defmodule ExHBase.Pb.ListNamespaceDescriptorsRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.ListNamespaceDescriptorsResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :namespaceDescriptor, 1, repeated: true, type: ExHBase.Pb.NamespaceDescriptor
end

defmodule ExHBase.Pb.ListTableDescriptorsByNamespaceRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :namespaceName, 1, required: true, type: :string
end

defmodule ExHBase.Pb.ListTableDescriptorsByNamespaceResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :tableSchema, 1, repeated: true, type: ExHBase.Pb.TableSchema
end

defmodule ExHBase.Pb.ListTableNamesByNamespaceRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :namespaceName, 1, required: true, type: :string
end

defmodule ExHBase.Pb.ListTableNamesByNamespaceResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :tableName, 1, repeated: true, type: ExHBase.Pb.TableName
end

defmodule ExHBase.Pb.ShutdownRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.ShutdownResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.StopMasterRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.StopMasterResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.BalanceRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :force, 1, optional: true, type: :bool
end

defmodule ExHBase.Pb.BalanceResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :balancer_ran, 1, required: true, type: :bool
end

defmodule ExHBase.Pb.SetBalancerRunningRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :on, 1, required: true, type: :bool
  field :synchronous, 2, optional: true, type: :bool
end

defmodule ExHBase.Pb.SetBalancerRunningResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :prev_balance_value, 1, optional: true, type: :bool
end

defmodule ExHBase.Pb.IsBalancerEnabledRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.IsBalancerEnabledResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :enabled, 1, required: true, type: :bool
end

defmodule ExHBase.Pb.SetSplitOrMergeEnabledRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :enabled, 1, required: true, type: :bool
  field :synchronous, 2, optional: true, type: :bool
  field :switch_types, 3, repeated: true, type: ExHBase.Pb.MasterSwitchType, enum: true
end

defmodule ExHBase.Pb.SetSplitOrMergeEnabledResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :prev_value, 1, repeated: true, type: :bool
end

defmodule ExHBase.Pb.IsSplitOrMergeEnabledRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :switch_type, 1, required: true, type: ExHBase.Pb.MasterSwitchType, enum: true
end

defmodule ExHBase.Pb.IsSplitOrMergeEnabledResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :enabled, 1, required: true, type: :bool
end

defmodule ExHBase.Pb.NormalizeRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.NormalizeResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :normalizer_ran, 1, required: true, type: :bool
end

defmodule ExHBase.Pb.SetNormalizerRunningRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :on, 1, required: true, type: :bool
end

defmodule ExHBase.Pb.SetNormalizerRunningResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :prev_normalizer_value, 1, optional: true, type: :bool
end

defmodule ExHBase.Pb.IsNormalizerEnabledRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.IsNormalizerEnabledResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :enabled, 1, required: true, type: :bool
end

defmodule ExHBase.Pb.RunCatalogScanRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.RunCatalogScanResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :scan_result, 1, optional: true, type: :int32
end

defmodule ExHBase.Pb.EnableCatalogJanitorRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :enable, 1, required: true, type: :bool
end

defmodule ExHBase.Pb.EnableCatalogJanitorResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :prev_value, 1, optional: true, type: :bool
end

defmodule ExHBase.Pb.IsCatalogJanitorEnabledRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.IsCatalogJanitorEnabledResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :value, 1, required: true, type: :bool
end

defmodule ExHBase.Pb.SnapshotRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :snapshot, 1, required: true, type: ExHBase.Pb.SnapshotDescription
end

defmodule ExHBase.Pb.SnapshotResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :expected_timeout, 1, required: true, type: :int64
end

defmodule ExHBase.Pb.GetCompletedSnapshotsRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.GetCompletedSnapshotsResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :snapshots, 1, repeated: true, type: ExHBase.Pb.SnapshotDescription
end

defmodule ExHBase.Pb.DeleteSnapshotRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :snapshot, 1, required: true, type: ExHBase.Pb.SnapshotDescription
end

defmodule ExHBase.Pb.DeleteSnapshotResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.RestoreSnapshotRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :snapshot, 1, required: true, type: ExHBase.Pb.SnapshotDescription
end

defmodule ExHBase.Pb.RestoreSnapshotResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.IsSnapshotDoneRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :snapshot, 1, optional: true, type: ExHBase.Pb.SnapshotDescription
end

defmodule ExHBase.Pb.IsSnapshotDoneResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :done, 1, optional: true, type: :bool, default: false
  field :snapshot, 2, optional: true, type: ExHBase.Pb.SnapshotDescription
end

defmodule ExHBase.Pb.IsRestoreSnapshotDoneRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :snapshot, 1, optional: true, type: ExHBase.Pb.SnapshotDescription
end

defmodule ExHBase.Pb.IsRestoreSnapshotDoneResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :done, 1, optional: true, type: :bool, default: false
end

defmodule ExHBase.Pb.GetSchemaAlterStatusRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :table_name, 1, required: true, type: ExHBase.Pb.TableName
end

defmodule ExHBase.Pb.GetSchemaAlterStatusResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :yet_to_update_regions, 1, optional: true, type: :uint32
  field :total_regions, 2, optional: true, type: :uint32
end

defmodule ExHBase.Pb.GetTableDescriptorsRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :table_names, 1, repeated: true, type: ExHBase.Pb.TableName
  field :regex, 2, optional: true, type: :string
  field :include_sys_tables, 3, optional: true, type: :bool, default: false
  field :namespace, 4, optional: true, type: :string
end

defmodule ExHBase.Pb.GetTableDescriptorsResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :table_schema, 1, repeated: true, type: ExHBase.Pb.TableSchema
end

defmodule ExHBase.Pb.GetTableNamesRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :regex, 1, optional: true, type: :string
  field :include_sys_tables, 2, optional: true, type: :bool, default: false
  field :namespace, 3, optional: true, type: :string
end

defmodule ExHBase.Pb.GetTableNamesResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :table_names, 1, repeated: true, type: ExHBase.Pb.TableName
end

defmodule ExHBase.Pb.GetClusterStatusRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.GetClusterStatusResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :cluster_status, 1, required: true, type: ExHBase.Pb.ClusterStatus
end

defmodule ExHBase.Pb.IsMasterRunningRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.IsMasterRunningResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :is_master_running, 1, required: true, type: :bool
end

defmodule ExHBase.Pb.ExecProcedureRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :procedure, 1, required: true, type: ExHBase.Pb.ProcedureDescription
end

defmodule ExHBase.Pb.ExecProcedureResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :expected_timeout, 1, optional: true, type: :int64
  field :return_data, 2, optional: true, type: :bytes
end

defmodule ExHBase.Pb.IsProcedureDoneRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :procedure, 1, optional: true, type: ExHBase.Pb.ProcedureDescription
end

defmodule ExHBase.Pb.IsProcedureDoneResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :done, 1, optional: true, type: :bool, default: false
  field :snapshot, 2, optional: true, type: ExHBase.Pb.ProcedureDescription
end

defmodule ExHBase.Pb.GetProcedureResultRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :proc_id, 1, required: true, type: :uint64
end

defmodule ExHBase.Pb.GetProcedureResultResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :state, 1, required: true, type: ExHBase.Pb.GetProcedureResultResponse.State, enum: true
  field :start_time, 2, optional: true, type: :uint64
  field :last_update, 3, optional: true, type: :uint64
  field :result, 4, optional: true, type: :bytes
  field :exception, 5, optional: true, type: ExHBase.Pb.ForeignExceptionMessage
end

defmodule ExHBase.Pb.AbortProcedureRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :proc_id, 1, required: true, type: :uint64
  field :mayInterruptIfRunning, 2, optional: true, type: :bool, default: true
end

defmodule ExHBase.Pb.AbortProcedureResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :is_procedure_aborted, 1, required: true, type: :bool
end

defmodule ExHBase.Pb.ListProceduresRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.ListProceduresResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :procedure, 1, repeated: true, type: ExHBase.Pb.Procedure
end

defmodule ExHBase.Pb.SetQuotaRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :user_name, 1, optional: true, type: :string
  field :user_group, 2, optional: true, type: :string
  field :namespace, 3, optional: true, type: :string
  field :table_name, 4, optional: true, type: ExHBase.Pb.TableName
  field :remove_all, 5, optional: true, type: :bool
  field :bypass_globals, 6, optional: true, type: :bool
  field :throttle, 7, optional: true, type: ExHBase.Pb.ThrottleRequest
end

defmodule ExHBase.Pb.SetQuotaResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.MajorCompactionTimestampRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :table_name, 1, required: true, type: ExHBase.Pb.TableName
end

defmodule ExHBase.Pb.MajorCompactionTimestampForRegionRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :region, 1, required: true, type: ExHBase.Pb.RegionSpecifier
end

defmodule ExHBase.Pb.MajorCompactionTimestampResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :compaction_timestamp, 1, required: true, type: :int64
end

defmodule ExHBase.Pb.SecurityCapabilitiesRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.SecurityCapabilitiesResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :capabilities, 1,
    repeated: true,
    type: ExHBase.Pb.SecurityCapabilitiesResponse.Capability,
    enum: true
end