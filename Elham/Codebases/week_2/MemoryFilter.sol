// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    /**
     * @dev Filters even numbers into a new memory array.
     * @param numbers The input dynamic array to filter.
     * @return An array containing only the even numbers.
     */
    function filterEven(uint[] calldata numbers) external pure returns (uint[] memory) {
        uint evenCount = 0;

        // Pass 1: Count how many even numbers exist to determine array size
        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                evenCount++;
            }
        }

        // Initialize the memory array with the exact size needed
        uint[] memory filtered = new uint[](evenCount);
        
        // Pass 2: Fill the filtered array
        uint currentIndex = 0;
        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                filtered[currentIndex] = numbers[i];
                currentIndex++;
            }
        }

        return filtered;
    }
}