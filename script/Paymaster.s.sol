// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import { Script } from "forge-std/Script.sol";
import { SimpleSemaphorePaymaster } from "../src/Paymaster.sol";
import { SemaphoreAdmin } from "../src/Admin.sol";
import { console } from "forge-std/console.sol";

contract DeploySimpleSemaphorePaymaster is Script {
    address internal _verifier = 0x6C42599435B82121794D835263C846384869502d; // base sepolia
    address internal _entryPoint = 0x0000000071727De22E5E9d8BAf0edAc6f37da032;

    function run() external returns (SimpleSemaphorePaymaster) {
        // Begin sending transactions
        vm.startBroadcast();

        // Deploy the contract
        SimpleSemaphorePaymaster paymaster = new SimpleSemaphorePaymaster(_entryPoint, _verifier);
        // paymaster.addStake{value: 1000000000000000000}(1);

        SemaphoreAdmin admin = new SemaphoreAdmin(0.001 ether);

        // Stop broadcasting transactions
        vm.stopBroadcast();

        // Log the deployment address
        console.log("SimpleSemaphorePaymaster deployed at:", address(paymaster));
        console.log("SemaphoreAdmin deployed at:", address(admin));

        return paymaster;
    }
}
