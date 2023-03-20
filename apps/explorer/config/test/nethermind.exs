import Config

config :explorer,
  transport: EthereumJSONRPC.HTTP,
  json_rpc_named_arguments: [
    transport: EthereumJSONRPC.Mox,
    transport_options: [],
<<<<<<<< HEAD:apps/explorer/config/test/erigon.exs
    variant: EthereumJSONRPC.Erigon
========
    variant: EthereumJSONRPC.Nethermind
>>>>>>>> v5.1.1-beta-branch:apps/explorer/config/test/nethermind.exs
  ],
  subscribe_named_arguments: [
    transport: EthereumJSONRPC.Mox,
    transport_options: [],
<<<<<<<< HEAD:apps/explorer/config/test/erigon.exs
    variant: EthereumJSONRPC.Erigon
========
    variant: EthereumJSONRPC.Nethermind
>>>>>>>> v5.1.1-beta-branch:apps/explorer/config/test/nethermind.exs
  ]
