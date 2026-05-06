// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    struct User {
        uint balance;
        bool isActive;
    }

    mapping(address => User) public users;

    function createUser() external {
        require(!users[msg.sender].isActive, "User already exists!");
        users[msg.sender] = User({
            balance: 100,
            isActive: true
        });
    }

    /**
     * @dev Transfers 'amount' from sender to recipient.
     * @param _recipient The address receiving the tokens.
     * @param _amount The number of tokens to send.
     */
    function transfer(address _recipient, uint _amount) external {
        // 1. Security Checks
        require(users[msg.sender].isActive, "Sender must be an active user.");
        require(users[_recipient].isActive, "Recipient must be an active user.");
        require(users[msg.sender].balance >= _amount, "Insufficient balance for transfer.");

        // 2. Perform the transfer
        // Using storage pointers to update the structs directly in state
        users[msg.sender].balance -= _amount;
        users[_recipient].balance += _amount;
    }
}