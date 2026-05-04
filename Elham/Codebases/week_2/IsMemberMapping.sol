// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // Mapping that stores membership status for each address
    mapping(address => bool) public members;

    /**
     * @dev Adds an address as a member.
     * @param _addr The address to be added.
     */
    function addMember(address _addr) external {
        members[_addr] = true;
    }

    /**
     * @dev Checks if an address is a member using a direct mapping lookup.
     * @param _addr The address to check.
     * @return bool True if the address is a member, false otherwise.
     */
    function isMember(address _addr) external view returns (bool) {
        // Direct retrieval: much faster and cheaper than an array loop
        return members[_addr];
    }
}