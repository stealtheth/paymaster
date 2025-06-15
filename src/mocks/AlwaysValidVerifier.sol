// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity ^0.8.28;

contract AlwaysValidVerifier {
    function verifyProof(
        uint256[2] calldata,
        uint256[2][2] calldata,
        uint256[2] calldata,
        uint256[4] calldata,
        uint256
    )
        external
        pure
        returns (bool)
    {
        // Mock implementation that always returns true
        return true;
    }
}
