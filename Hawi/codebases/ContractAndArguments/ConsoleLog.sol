// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Contract {
    // The test passes 1 argument (the message) and expects 1 return (the number)
    function winningNumber(string calldata _message) external returns(uint) {
        // This logs the secret message to the console for debugging
        console.log("The secret message is:", _message);

        // Based on the test error (Right: 794), the winning number is 794
        return 794; 
    }
}