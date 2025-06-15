// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import { ISemaphore } from "@semaphore-protocol/contracts/interfaces/ISemaphore.sol";

/**
 * @title SemaphoreAdmin, allows anyone to join a semaphore group that later allows for anonymous gas payment by
 * requiring them to deposit a fixed amount of eth
 */
contract SemaphoreAdmin {
    uint256 public immutable DEPOSIT_AMOUNT;

    error InvalidDepositAmount();

    /**
     * @notice Constructs the admin with required parameters
     * @param _depositAmount The amount of eth to deposit for each member of the group
     */
    constructor(uint256 _depositAmount) {
        DEPOSIT_AMOUNT = _depositAmount;
    }

    /**
     * @notice Allows anyone to deposit funds for a specific group to be used for gas payment for members of the group
     * @param groupId The ID of the group to deposit for
     * @param semaphore The semaphore contract
     * @param identityCommitment The identity commitment of the member to add to the group
     */
    function joinGroup(uint256 groupId, ISemaphore semaphore, uint256 identityCommitment) external payable {
        if (msg.value != DEPOSIT_AMOUNT) revert InvalidDepositAmount();
        semaphore.addMember(groupId, identityCommitment);
    }
}
