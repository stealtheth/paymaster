# Simple Semaphore Paymaster

simple semaphore paymaster that allows users to deposit gas (eth) into a paymaster for later anonymous use.

## Useful commands

Build smart contracts:

```bash
yarn install
```

```bash
yarn build
```

Run tests:

```bash
yarn test
```

## Deployments

contracts are deployed to Sepolia:

```
== Logs ==
  SimpleSemaphorePaymaster deployed at: 0x67D4dd5251D7797590A4C99d55320Eabd3C8611a
  SemaphoreAdmin deployed at: 0x13e7f88382041201F23d58BaE18eA9d2248f4e3b
```

run deployment:
set env variables based on example env and then run `source .env` to load them, and then run the script:

`forge script script/Paymaster.s.sol --private-key $PRIVATE_KEY --rpc-url $SEPOLIA_RPC_URL --etherscan-api-key $ETHERSCAN_API_KEY --broadcast --verify -vvv`
