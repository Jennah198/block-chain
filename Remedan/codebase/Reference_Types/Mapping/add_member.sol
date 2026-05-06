// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {

    // Mapping: address => isMember (true/false)
    mapping(address => bool) public members;

    // Add a member
    function addMember(address newMember) external {
        members[newMember] = true;
    }
}