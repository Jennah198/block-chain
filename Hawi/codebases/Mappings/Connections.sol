// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    enum ConnectionTypes { 
        None, 
        Friends, 
        Family, 
        Work 
    }

    // Public nested mapping: User Address -> Other Address -> Connection Type
    mapping(address => mapping(address => ConnectionTypes)) public connections;

    /**
     * @dev Establishes a connection between the sender and another address.
     * @param other The address to connect with.
     * @param connectionType The type of relationship to establish.
     */
    function connectWith(address other, ConnectionTypes connectionType) external {
        // Set the value in the nested mapping
        connections[msg.sender][other] = connectionType;
    }
}