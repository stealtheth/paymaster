// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import { Script } from "forge-std/Script.sol";
import { OffchainResolver } from "../src/ENSResolver.sol";
import { console } from "forge-std/console.sol";

contract DeployENSResolver is Script {
    string internal _url = "https://docs.ens.domains/api/example/basic-gateway";

    function run() external returns (OffchainResolver) {
        // Begin sending transactions
        vm.startBroadcast();

        // Deploy the contract
        OffchainResolver resolver = new OffchainResolver(_url);

        // Stop broadcasting transactions
        vm.stopBroadcast();

        // Log the deployment address
        console.log("OffchainResolver deployed at:", address(resolver));

        return resolver;
    }
}
