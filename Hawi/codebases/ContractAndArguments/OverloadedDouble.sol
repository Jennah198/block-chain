// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // Task 5: Single parameter
    function double(uint _x) public pure returns(uint) {
        return _x * 2;
    }

    // Task 6: Overloaded version with two parameters
    // Using a Tuple to return two values at once
    function double(uint _x, uint _y) external pure returns(uint, uint) {
        return (_x * 2, _y * 2);
    }
}