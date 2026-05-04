// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    enum ConnectionTypes { 
        Unacquainted, 
        Friend, 
        Family, 
        Coworker 
    }

    // 1. Create a public nested mapping
    // address (User) -> address (Contact) -> ConnectionType
    mapping(address => mapping(address => ConnectionTypes)) public connections;

    /**
     * @dev Establishes a connection from the sender to another address.
     * @param _other The address to connect with.
     * @param _type The type of relationship.
     */
    function connectWith(address _other, ConnectionTypes _type) external {
        // 2. Set the connection type for the sender-to-other relationship
        connections[msg.sender][_other] = _type;
    }
}