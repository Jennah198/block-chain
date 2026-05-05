// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // State variable stored in 'storage'
    uint[] public evenNumbers;

    /**
     * @dev Filters even numbers from an input array and saves them to storage.
     * @param numbers A dynamic array of uints to filter.
     */
    function filterEven(uint[] calldata numbers) external {
        for (uint i = 0; i < numbers.length; i++) {
            // Check if the number is even using the modulo operator (%)
            if (numbers[i] % 2 == 0) {
                evenNumbers.push(numbers[i]);
            }
        }
    }
}