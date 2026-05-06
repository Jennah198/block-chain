// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    
    // Storage array to hold even numbers
    uint[] public evenNumbers;

    // Function to filter and store even numbers
    function filterEven(uint[] calldata numbers) external {
        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                evenNumbers.push(numbers[i]);
            }
        }
    }
}