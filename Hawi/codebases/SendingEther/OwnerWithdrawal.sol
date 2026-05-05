// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    address public owner;

    // The constructor must be payable because the first task required a deposit
    constructor() payable {
        owner = msg.sender;
    }

    // Ensure this is 'public' so the test can see it
    function withdraw() public {
        // Only the owner is allowed to call this
        require(msg.sender == owner, "Not the owner");

        // Send the balance to the owner
        uint balance = address(this).balance;
        (bool success, ) = owner.call{ value: balance }("");
        require(success, "Transfer failed");
    }
}