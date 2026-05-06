// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    
    function filterEven(uint[] calldata numbers) external pure returns (uint[] memory) {
        uint count = 0;

        // Step 1: Count even numbers
        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                count++;
            }
        }

        // Step 2: Create memory array with exact size
        uint[] memory evens = new uint[](count);

        uint index = 0;

        // Step 3: Fill the array
        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                evens[index] = numbers[i];
                index++;
            }
        }

        return evens;
    }
}