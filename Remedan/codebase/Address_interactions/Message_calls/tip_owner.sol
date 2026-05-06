// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract Contract {

    // Public state variable
    address public owner;

    // Constructor runs once when contract is deployed
    constructor() {
        owner = msg.sender;
    }

    // Receive Ether without calldata
    receive() external payable {

    }

    // Tip function: sends ETH to the owner
    function tip() public payable {
        (bool success, ) = owner.call{ value: msg.value }("");
        require(success);
    }
}