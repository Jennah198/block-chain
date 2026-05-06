// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    uint public x;

    constructor(uint _x) {
        x = _x;
    }

    function increment() external {
        x = x + 1;
    }

    // Your Goal: Add the 'add' function
    // It takes a uint parameter and returns (parameter + x)
    function add(uint _y) external view returns(uint) {
        return x + _y;
    }
}