// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "forge-std/console.sol";

contract Contract {
    function winningNumber(string calldata _msg) external view returns(uint) {
        
        console.log("The secret message is:", _msg);

        return 794; 
    }
}