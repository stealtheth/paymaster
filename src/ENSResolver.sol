// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

contract OffchainResolver {
    string public url = "https://docs.ens.domains/api/example/basic-gateway";

    error OffchainLookup(address sender, string[] urls, bytes callData, bytes4 callbackFunction, bytes extraData);

    constructor(string memory _url) {
        url = _url;
    }

    function setUrl(string memory _url) external {
        url = _url;
    }

    function addr(bytes32 node) external view returns (address) {
        bytes memory callData = abi.encodeWithSelector(OffchainResolver.addr.selector, node);

        string[] memory urls = new string[](1);
        urls[0] = url;

        revert OffchainLookup(
            address(this), urls, callData, OffchainResolver.addrCallback.selector, abi.encode(callData, address(this))
        );
    }

    function addrCallback(bytes calldata response, bytes calldata) external pure returns (address) {
        address _addr = abi.decode(response, (address));
        return _addr;
    }

    function supportsInterface(bytes4 interfaceID) external pure returns (bool) {
        return
            interfaceID == OffchainResolver.supportsInterface.selector || interfaceID == OffchainResolver.addr.selector;
    }
}
