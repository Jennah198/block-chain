// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // Public storage variable
    uint public x;

    // The constructor runs only once upon deployment
    constructor(uint _x) {
        // Assigning the argument value to the storage variable
        x = _x;
    }
}