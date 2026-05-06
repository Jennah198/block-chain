// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // Goal: Create a pure function that doubles the input uint
    function double(uint _x) external pure returns(uint) {
        return _x * 2;
    }

    /* 
    Alternative Implicit Syntax:
    function double(uint _x) external pure returns(uint sum) {
        sum = _x * 2;
    }
    */
}