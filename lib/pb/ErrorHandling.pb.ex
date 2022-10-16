defmodule ExHBase.Pb.StackTraceElementMessage do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :declaring_class, 1, optional: true, type: :string
  field :method_name, 2, optional: true, type: :string
  field :file_name, 3, optional: true, type: :string
  field :line_number, 4, optional: true, type: :int32
end

defmodule ExHBase.Pb.GenericExceptionMessage do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :class_name, 1, optional: true, type: :string
  field :message, 2, optional: true, type: :string
  field :error_info, 3, optional: true, type: :bytes
  field :trace, 4, repeated: true, type: ExHBase.Pb.StackTraceElementMessage
end

defmodule ExHBase.Pb.ForeignExceptionMessage do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :source, 1, optional: true, type: :string
  field :generic_exception, 2, optional: true, type: ExHBase.Pb.GenericExceptionMessage
end