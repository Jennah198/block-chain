// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    function sum(uint[5] calldata numbers) external pure returns (uint) {
        uint total = 0;

        // Standard for loop to iterate through the 5 elements
        for(uint i = 0; i < 5; i++) {
            total += numbers[i];
        }

        return total;
    }
}
