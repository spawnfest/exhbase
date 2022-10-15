defmodule Pb.ClusterId do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :cluster_id, 1, required: true, type: :string
end