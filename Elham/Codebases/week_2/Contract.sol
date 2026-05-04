// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    /**
     * @dev Calculates the sum of a dynamically sized array of integers.
     * @param numbers A dynamic array of unsigned integers.
     * @return The total sum of all elements in the array.
     */
    function sum(uint[] calldata numbers) external pure returns (uint) {
        uint total = 0;

        // Use the .length property to iterate through the dynamic array
        for (uint i = 0; i < numbers.length; i++) {
            total += numbers[i];
        }

        return total;
    }
}