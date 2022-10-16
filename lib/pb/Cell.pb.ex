defmodule ExHBase.Pb.CellType do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :MINIMUM, 0
  field :PUT, 4
  field :DELETE, 8
  field :DELETE_COLUMN, 12
  field :DELETE_FAMILY, 14
  field :MAXIMUM, 255
end

defmodule ExHBase.Pb.Cell do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :row, 1, optional: true, type: :bytes
  field :family, 2, optional: true, type: :bytes
  field :qualifier, 3, optional: true, type: :bytes
  field :timestamp, 4, optional: true, type: :uint64
  field :cell_type, 5, optional: true, type: ExHBase.Pb.CellType, enum: true
  field :value, 6, optional: true, type: :bytes
  field :tags, 7, optional: true, type: :bytes
end

defmodule ExHBase.Pb.KeyValue do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :row, 1, required: true, type: :bytes
  field :family, 2, required: true, type: :bytes
  field :qualifier, 3, required: true, type: :bytes
  field :timestamp, 4, optional: true, type: :uint64
  field :key_type, 5, optional: true, type: ExHBase.Pb.CellType, enum: true
  field :value, 6, optional: true, type: :bytes
  field :tags, 7, optional: true, type: :bytes
end