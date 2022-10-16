defmodule ExHBase.Pb.BitComparator.BitwiseOp do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :AND, 1
  field :OR, 2
  field :XOR, 3
end

defmodule ExHBase.Pb.Comparator do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :name, 1, required: true, type: :string
  field :serialized_comparator, 2, optional: true, type: :bytes
end

defmodule ExHBase.Pb.ByteArrayComparable do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :value, 1, optional: true, type: :bytes
end

defmodule ExHBase.Pb.BinaryComparator do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :comparable, 1, required: true, type: ExHBase.Pb.ByteArrayComparable
end

defmodule ExHBase.Pb.LongComparator do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :comparable, 1, required: true, type: ExHBase.Pb.ByteArrayComparable
end

defmodule ExHBase.Pb.BinaryPrefixComparator do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :comparable, 1, required: true, type: ExHBase.Pb.ByteArrayComparable
end

defmodule ExHBase.Pb.BitComparator do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :comparable, 1, required: true, type: ExHBase.Pb.ByteArrayComparable
  field :bitwise_op, 2, required: true, type: ExHBase.Pb.BitComparator.BitwiseOp, enum: true
end

defmodule ExHBase.Pb.NullComparator do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end

defmodule ExHBase.Pb.RegexStringComparator do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :pattern, 1, required: true, type: :string
  field :pattern_flags, 2, required: true, type: :int32
  field :charset, 3, required: true, type: :string
  field :engine, 4, optional: true, type: :string
end

defmodule ExHBase.Pb.SubstringComparator do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :substr, 1, required: true, type: :string
end