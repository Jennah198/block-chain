// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    address public owner;

    constructor() payable {
        // Store the deployer as the owner
        owner = msg.sender;
    }

    function withdraw() public {
        // 1. Restrict access: Only the owner can call this
        require(msg.sender == owner, "Only the owner can withdraw funds");

        // 2. Get the contract's current balance
        uint balance = address(this).balance;

        // 3. Send all funds to the owner
        (bool success, ) = owner.call{ value: balance }("");
        
        // 4. Ensure the transfer was successful
        require(success, "Withdrawal failed");
    }
}