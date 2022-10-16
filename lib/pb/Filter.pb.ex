defmodule ExHBase.Pb.FilterList.Operator do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :MUST_PASS_ALL, 1
  field :MUST_PASS_ONE, 2
end

defmodule ExHBase.Pb.Filter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :name, 1, required: true, type: :string
  field :serialized_filter, 2, optional: true, type: :bytes
end

defmodule ExHBase.Pb.ColumnCountGetFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :limit, 1, required: true, type: :int32
end

defmodule ExHBase.Pb.ColumnPaginationFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :limit, 1, required: true, type: :int32
  field :offset, 2, optional: true, type: :int32
  field :column_offset, 3, optional: true, type: :bytes
end

defmodule ExHBase.Pb.ColumnPrefixFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :prefix, 1, required: true, type: :bytes
end

defmodule ExHBase.Pb.ColumnRangeFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :min_column, 1, optional: true, type: :bytes
  field :min_column_inclusive, 2, optional: true, type: :bool
  field :max_column, 3, optional: true, type: :bytes
  field :max_column_inclusive, 4, optional: true, type: :bool
end

defmodule ExHBase.Pb.CompareFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :compare_op, 1, required: true, type: ExHBase.Pb.CompareType, enum: true
  field :comparator, 2, optional: true, type: ExHBase.Pb.Comparator
end

defmodule ExHBase.Pb.DependentColumnFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :compare_filter, 1, required: true, type: ExHBase.Pb.CompareFilter
  field :column_family, 2, optional: true, type: :bytes
  field :column_qualifier, 3, optional: true, type: :bytes
  field :drop_dependent_column, 4, optional: true, type: :bool
end

defmodule ExHBase.Pb.FamilyFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :compare_filter, 1, required: true, type: ExHBase.Pb.CompareFilter
end

defmodule ExHBase.Pb.FilterList do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :operator, 1, required: true, type: ExHBase.Pb.FilterList.Operator, enum: true
  field :filters, 2, repeated: true, type: ExHBase.Pb.Filter
end

defmodule ExHBase.Pb.FilterWrapper do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :filter, 1, required: true, type: ExHBase.Pb.Filter
end

defmodule ExHBase.Pb.FirstKeyOnlyFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.FirstKeyValueMatchingQualifiersFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :qualifiers, 1, repeated: true, type: :bytes
end

defmodule ExHBase.Pb.FuzzyRowFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :fuzzy_keys_data, 1, repeated: true, type: ExHBase.Pb.BytesBytesPair
end

defmodule ExHBase.Pb.InclusiveStopFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :stop_row_key, 1, optional: true, type: :bytes
end

defmodule ExHBase.Pb.KeyOnlyFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :len_as_val, 1, required: true, type: :bool
end

defmodule ExHBase.Pb.MultipleColumnPrefixFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :sorted_prefixes, 1, repeated: true, type: :bytes
end

defmodule ExHBase.Pb.PageFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :page_size, 1, required: true, type: :int64
end

defmodule ExHBase.Pb.PrefixFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :prefix, 1, optional: true, type: :bytes
end

defmodule ExHBase.Pb.QualifierFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :compare_filter, 1, required: true, type: ExHBase.Pb.CompareFilter
end

defmodule ExHBase.Pb.RandomRowFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :chance, 1, required: true, type: :float
end

defmodule ExHBase.Pb.RowFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :compare_filter, 1, required: true, type: ExHBase.Pb.CompareFilter
end

defmodule ExHBase.Pb.SingleColumnValueExcludeFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :single_column_value_filter, 1, required: true, type: ExHBase.Pb.SingleColumnValueFilter
end

defmodule ExHBase.Pb.SingleColumnValueFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :column_family, 1, optional: true, type: :bytes
  field :column_qualifier, 2, optional: true, type: :bytes
  field :compare_op, 3, required: true, type: ExHBase.Pb.CompareType, enum: true
  field :comparator, 4, required: true, type: ExHBase.Pb.Comparator
  field :filter_if_missing, 5, optional: true, type: :bool
  field :latest_version_only, 6, optional: true, type: :bool
end

defmodule ExHBase.Pb.SkipFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :filter, 1, required: true, type: ExHBase.Pb.Filter
end

defmodule ExHBase.Pb.TimestampsFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :timestamps, 1, repeated: true, type: :int64, packed: true, deprecated: false
  field :can_hint, 2, optional: true, type: :bool
end

defmodule ExHBase.Pb.ValueFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :compare_filter, 1, required: true, type: ExHBase.Pb.CompareFilter
end

defmodule ExHBase.Pb.WhileMatchFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :filter, 1, required: true, type: ExHBase.Pb.Filter
end

defmodule ExHBase.Pb.FilterAllFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.RowRange do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :start_row, 1, optional: true, type: :bytes
  field :start_row_inclusive, 2, optional: true, type: :bool
  field :stop_row, 3, optional: true, type: :bytes
  field :stop_row_inclusive, 4, optional: true, type: :bool
end

defmodule ExHBase.Pb.MultiRowRangeFilter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :row_range_list, 1, repeated: true, type: ExHBase.Pb.RowRange
end