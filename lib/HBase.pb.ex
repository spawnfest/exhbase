defmodule Pb.CompareType do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :LESS, 0
  field :LESS_OR_EQUAL, 1
  field :EQUAL, 2
  field :NOT_EQUAL, 3
  field :GREATER_OR_EQUAL, 4
  field :GREATER, 5
  field :NO_OP, 6
end

defmodule Pb.TimeUnit do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :NANOSECONDS, 1
  field :MICROSECONDS, 2
  field :MILLISECONDS, 3
  field :SECONDS, 4
  field :MINUTES, 5
  field :HOURS, 6
  field :DAYS, 7
end

defmodule Pb.RegionSpecifier.RegionSpecifierType do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :REGION_NAME, 1
  field :ENCODED_REGION_NAME, 2
end

defmodule Pb.SnapshotDescription.Type do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :DISABLED, 0
  field :FLUSH, 1
  field :SKIPFLUSH, 2
end

defmodule Pb.TableName do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :namespace, 1, required: true, type: :bytes
  field :qualifier, 2, required: true, type: :bytes
end

defmodule Pb.TableSchema do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :table_name, 1, optional: true, type: Pb.TableName
  field :attributes, 2, repeated: true, type: Pb.BytesBytesPair
  field :column_families, 3, repeated: true, type: Pb.ColumnFamilySchema
  field :configuration, 4, repeated: true, type: Pb.NameStringPair
end

defmodule Pb.ColumnFamilySchema do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :name, 1, required: true, type: :bytes
  field :attributes, 2, repeated: true, type: Pb.BytesBytesPair
  field :configuration, 3, repeated: true, type: Pb.NameStringPair
end

defmodule Pb.RegionInfo do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :region_id, 1, required: true, type: :uint64
  field :table_name, 2, required: true, type: Pb.TableName
  field :start_key, 3, optional: true, type: :bytes
  field :end_key, 4, optional: true, type: :bytes
  field :offline, 5, optional: true, type: :bool
  field :split, 6, optional: true, type: :bool
  field :replica_id, 7, optional: true, type: :int32, default: 0
end

defmodule Pb.FavoredNodes do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :favored_node, 1, repeated: true, type: Pb.ServerName
end

defmodule Pb.RegionSpecifier do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :type, 1, required: true, type: Pb.RegionSpecifier.RegionSpecifierType, enum: true
  field :value, 2, required: true, type: :bytes
end

defmodule Pb.TimeRange do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :from, 1, optional: true, type: :uint64
  field :to, 2, optional: true, type: :uint64
end

defmodule Pb.ColumnFamilyTimeRange do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :column_family, 1, required: true, type: :bytes
  field :time_range, 2, required: true, type: Pb.TimeRange
end

defmodule Pb.ServerName do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :host_name, 1, required: true, type: :string
  field :port, 2, optional: true, type: :uint32
  field :start_code, 3, optional: true, type: :uint64
end

defmodule Pb.Coprocessor do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :name, 1, required: true, type: :string
end

defmodule Pb.NameStringPair do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :name, 1, required: true, type: :string
  field :value, 2, required: true, type: :string
end

defmodule Pb.NameBytesPair do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :name, 1, required: true, type: :string
  field :value, 2, optional: true, type: :bytes
end

defmodule Pb.BytesBytesPair do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :first, 1, required: true, type: :bytes
  field :second, 2, required: true, type: :bytes
end

defmodule Pb.NameInt64Pair do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :name, 1, optional: true, type: :string
  field :value, 2, optional: true, type: :int64
end

defmodule Pb.SnapshotDescription do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :name, 1, required: true, type: :string
  field :table, 2, optional: true, type: :string
  field :creation_time, 3, optional: true, type: :int64, default: 0
  field :type, 4, optional: true, type: Pb.SnapshotDescription.Type, default: :FLUSH, enum: true
  field :version, 5, optional: true, type: :int32
  field :owner, 6, optional: true, type: :string
end

defmodule Pb.ProcedureDescription do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :signature, 1, required: true, type: :string
  field :instance, 2, optional: true, type: :string
  field :creation_time, 3, optional: true, type: :int64, default: 0
  field :configuration, 4, repeated: true, type: Pb.NameStringPair
end

defmodule Pb.EmptyMsg do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule Pb.LongMsg do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :long_msg, 1, required: true, type: :int64
end

defmodule Pb.DoubleMsg do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :double_msg, 1, required: true, type: :double
end

defmodule Pb.BigDecimalMsg do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :bigdecimal_msg, 1, required: true, type: :bytes
end

defmodule Pb.UUID do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :least_sig_bits, 1, required: true, type: :uint64
  field :most_sig_bits, 2, required: true, type: :uint64
end

defmodule Pb.NamespaceDescriptor do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :name, 1, required: true, type: :bytes
  field :configuration, 2, repeated: true, type: Pb.NameStringPair
end

defmodule Pb.VersionInfo do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :version, 1, required: true, type: :string
  field :url, 2, required: true, type: :string
  field :revision, 3, required: true, type: :string
  field :user, 4, required: true, type: :string
  field :date, 5, required: true, type: :string
  field :src_checksum, 6, required: true, type: :string
  field :version_major, 7, optional: true, type: :uint32
  field :version_minor, 8, optional: true, type: :uint32
end

defmodule Pb.RegionServerInfo do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :infoPort, 1, optional: true, type: :int32
  field :version_info, 2, optional: true, type: Pb.VersionInfo
end