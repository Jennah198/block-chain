// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // 1. Create a public address state variable
    address public owner;

    // 2. The constructor runs once when the contract is deployed
    constructor() {
        // Store the address of the person deploying the contract
        owner = msg.sender;
    }
}