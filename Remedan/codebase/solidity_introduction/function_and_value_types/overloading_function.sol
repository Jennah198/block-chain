// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract Contract {

    // Changed to public so it can be reused internally
    function double(uint x) public pure returns (uint) {
        return x * 2;
    }

    // Overloaded function
    function double(uint x, uint y) external pure returns (uint, uint) {
        return (x * 2, y * 2);
    }
}