// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // Maps address to membership status
    mapping(address => bool) public members;

    /**
     * @dev Adds an address as a member.
     */
    function addMember(address _addr) external {
        members[_addr] = true;
    }

    /**
     * @dev Returns true if the address is a member, false otherwise.
     * This lookup is much more gas-efficient than looping through an array.
     */
    function isMember(address _addr) external view returns (bool) {
        // Direct retrieval using the key
        return members[_addr];
    }
}