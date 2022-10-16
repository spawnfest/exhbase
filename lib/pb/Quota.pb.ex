defmodule ExHBase.Pb.QuotaScope do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :CLUSTER, 1
  field :MACHINE, 2
end

defmodule ExHBase.Pb.ThrottleType do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :REQUEST_NUMBER, 1
  field :REQUEST_SIZE, 2
  field :WRITE_NUMBER, 3
  field :WRITE_SIZE, 4
  field :READ_NUMBER, 5
  field :READ_SIZE, 6
end

defmodule ExHBase.Pb.QuotaType do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :THROTTLE, 1
end

defmodule ExHBase.Pb.TimedQuota do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :time_unit, 1, required: true, type: ExHBase.Pb.TimeUnit, enum: true
  field :soft_limit, 2, optional: true, type: :uint64
  field :share, 3, optional: true, type: :float
  field :scope, 4, optional: true, type: ExHBase.Pb.QuotaScope, default: :MACHINE, enum: true
end

defmodule ExHBase.Pb.Throttle do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :req_num, 1, optional: true, type: ExHBase.Pb.TimedQuota
  field :req_size, 2, optional: true, type: ExHBase.Pb.TimedQuota
  field :write_num, 3, optional: true, type: ExHBase.Pb.TimedQuota
  field :write_size, 4, optional: true, type: ExHBase.Pb.TimedQuota
  field :read_num, 5, optional: true, type: ExHBase.Pb.TimedQuota
  field :read_size, 6, optional: true, type: ExHBase.Pb.TimedQuota
end

defmodule ExHBase.Pb.ThrottleRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :type, 1, optional: true, type: ExHBase.Pb.ThrottleType, enum: true
  field :timed_quota, 2, optional: true, type: ExHBase.Pb.TimedQuota
end

defmodule ExHBase.Pb.Quotas do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :bypass_globals, 1, optional: true, type: :bool, default: false
  field :throttle, 2, optional: true, type: ExHBase.Pb.Throttle
end

defmodule ExHBase.Pb.QuotaUsage do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2
end