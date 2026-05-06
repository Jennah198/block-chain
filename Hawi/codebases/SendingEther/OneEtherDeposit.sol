// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // The constructor must be payable to receive Ether during deployment
    constructor() payable {
        // Require at least 1 ether deposit
        // If msg.value is less than 1 ether, the transaction reverts
        require(msg.value >= 1 ether, "You must send at least 1 Ether!");
    }
}