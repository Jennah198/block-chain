// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    struct User {
        uint balance;
        bool isActive;
    }

    // Maps an address to a User struct
    mapping(address => User) public users;

    /**
     * @dev Registers a new user with 100 tokens.
     * Reverts if the user is already active.
     */
    function createUser() external {
        // Security check: Ensure the sender is not already an active user
        require(!users[msg.sender].isActive, "User already exists!");

        // Initialize the User struct and map it to the sender's address
        users[msg.sender] = User({
            balance: 100,
            isActive: true
        });
    }
}