// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    struct User {
        uint balance;
        bool isActive;
    }

    mapping(address => User) public users;

    function createUser() external {
        require(!users[msg.sender].isActive, "User already exists");
        users[msg.sender] = User({
            balance: 100,
            isActive: true
        });
    }

    /**
     * @dev Transfers tokens between two active users.
     * @param _recipient The address receiving the tokens.
     * @param _amount The number of tokens to transfer.
     */
    function transfer(address _recipient, uint _amount) external {
        // 1. Security: Ensure both sender and recipient are active users
        require(users[msg.sender].isActive, "Sender must be an active user.");
        require(users[_recipient].isActive, "Recipient must be an active user.");

        // 2. Security: Ensure sender has enough balance
        require(users[msg.sender].balance >= _amount, "Insufficient balance for transfer.");

        // 3. Update the balances in storage
        users[msg.sender].balance -= _amount;
        users[_recipient].balance += _amount;
    }
}