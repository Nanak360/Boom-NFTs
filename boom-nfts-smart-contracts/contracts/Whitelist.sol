// SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {
    // Max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    // addresses that are whitelisted will be True
    mapping(address => bool) public whitelistedAddresses;

    // stores number of Addresses already white listed
    uint8 public numAddressesWhitelisted;

    // will set 'maxWhitelistedAddresses' at deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        require(!whitelistedAddresses[msg.sender], "Address has already been white listed");
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "Cannot whitelist any more Addresses. Limit exceeded.");
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}
