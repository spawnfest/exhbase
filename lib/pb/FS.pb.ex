defmodule ExHBase.Pb.Reference.Range do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :TOP, 0
  field :BOTTOM, 1
end

defmodule ExHBase.Pb.HBaseVersionFileContent do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :version, 1, required: true, type: :string
end

defmodule ExHBase.Pb.Reference do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :splitkey, 1, required: true, type: :bytes
  field :range, 2, required: true, type: ExHBase.Pb.Reference.Range, enum: true
end