// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    struct User {
        uint balance;
        bool isActive;
    }

    // 1. Create a public mapping from address to User struct
    mapping(address => User) public users;

    /**
     * @dev Creates a new user profile and grants 100 tokens.
     * Reverts if the user is already active.
     */
    function createUser() external {
        // 2. Security Check: Ensure the user is not already active
        require(!users[msg.sender].isActive, "User already exists and is active.");

        // 3. Associate a new User struct with the msg.sender key
        users[msg.sender] = User({
            balance: 100,
            isActive: true
        });
    }

    /**
     * @dev Helper to check a user's balance.
     * Note: 'public' mappings automatically create a getter function.
     */
    function getBalance(address _addr) external view returns (uint) {
        return users[_addr].balance;
    }
}