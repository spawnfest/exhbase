defmodule ExHBase.Pb.ProcedureState do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :INITIALIZING, 1
  field :RUNNABLE, 2
  field :WAITING, 3
  field :WAITING_TIMEOUT, 4
  field :ROLLEDBACK, 5
  field :FINISHED, 6
end

defmodule ExHBase.Pb.ProcedureWALEntry.Type do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :PROCEDURE_WAL_EOF, 1
  field :PROCEDURE_WAL_INIT, 2
  field :PROCEDURE_WAL_INSERT, 3
  field :PROCEDURE_WAL_UPDATE, 4
  field :PROCEDURE_WAL_DELETE, 5
  field :PROCEDURE_WAL_COMPACT, 6
end

defmodule ExHBase.Pb.Procedure do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :class_name, 1, required: true, type: :string
  field :parent_id, 2, optional: true, type: :uint64
  field :proc_id, 3, required: true, type: :uint64
  field :start_time, 4, required: true, type: :uint64
  field :owner, 5, optional: true, type: :string
  field :state, 6, required: true, type: ExHBase.Pb.ProcedureState, enum: true
  field :stack_id, 7, repeated: true, type: :uint32
  field :last_update, 8, required: true, type: :uint64
  field :timeout, 9, optional: true, type: :uint32
  field :exception, 10, optional: true, type: ExHBase.Pb.ForeignExceptionMessage
  field :result, 11, optional: true, type: :bytes
  field :state_data, 12, optional: true, type: :bytes
  field :nonce_group, 13, optional: true, type: :uint64, default: 0
  field :nonce, 14, optional: true, type: :uint64, default: 0
end

defmodule ExHBase.Pb.SequentialProcedureData do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :executed, 1, required: true, type: :bool
end

defmodule ExHBase.Pb.StateMachineProcedureData do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :state, 1, repeated: true, type: :uint32
end

defmodule ExHBase.Pb.ProcedureWALHeader do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :version, 1, required: true, type: :uint32
  field :type, 2, required: true, type: :uint32
  field :log_id, 3, required: true, type: :uint64
  field :min_proc_id, 4, required: true, type: :uint64
end

defmodule ExHBase.Pb.ProcedureWALTrailer do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :version, 1, required: true, type: :uint32
  field :tracker_pos, 2, required: true, type: :uint64
end

defmodule ExHBase.Pb.ProcedureStoreTracker.TrackerNode do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :start_id, 1, required: true, type: :uint64
  field :updated, 2, repeated: true, type: :uint64
  field :deleted, 3, repeated: true, type: :uint64
end

defmodule ExHBase.Pb.ProcedureStoreTracker do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :node, 1, repeated: true, type: ExHBase.Pb.ProcedureStoreTracker.TrackerNode
end

defmodule ExHBase.Pb.ProcedureWALEntry do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto2

  field :type, 1, required: true, type: ExHBase.Pb.ProcedureWALEntry.Type, enum: true
  field :procedure, 2, repeated: true, type: ExHBase.Pb.Procedure
  field :proc_id, 3, optional: true, type: :uint64
end