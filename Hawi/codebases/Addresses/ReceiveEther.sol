// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Contract {
    // The receive function handles direct Ether transfers
    // It must be external and payable
    receive() external payable {
        console.log("Ether received! Amount in Wei:", msg.value);
    }
}
