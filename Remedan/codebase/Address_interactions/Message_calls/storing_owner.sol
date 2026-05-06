// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract Contract {

    // Public state variable
    address public owner;

    // Constructor runs once when contract is deployed
    constructor() {
        owner = msg.sender;
    }
}