// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {

    struct User {
        uint balance;
        bool isActive;
    }

    // Mapping: address => User struct
    mapping(address => User) public users;

    function createUser() external {
        // prevent duplicate active users
        require(!users[msg.sender].isActive, "User already exists");

        // create new user with 100 tokens
        users[msg.sender] = User({
            balance: 100,
            isActive: true
        });
    }
}