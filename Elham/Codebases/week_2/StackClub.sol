// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title StackClub
 * @dev A LIFO member management system with member-only access control.
 */
contract StackClub {
    // Dynamic array to store club member addresses
    address[] public members;

    // Constructor runs once and adds the deployer as the first member
    constructor() {
        members.push(msg.sender);
    }

    /**
     * @dev Adds a new member. Only existing members can call this.
     * @param _newMember The address to be added.
     */
    function addMember(address _newMember) external {
        require(isMember(msg.sender), "Only members can add new members");
        members.push(_newMember);
    }

    /**
     * @dev Removes the most recently added member. Only members can call this.
     */
    function removeLastMember() external {
        require(isMember(msg.sender), "Only members can remove members");
        // Ensure there is something to pop to prevent underflow errors
        require(members.length > 0, "No members to remove");
        
        members.pop();
    }

    /**
     * @dev Checks if an address is currently a member.
     * @param _addr The address to search for.
     * @return bool True if the address is found in the array.
     */
    function isMember(address _addr) public view returns (bool) {
        for (uint i = 0; i < members.length; i++) {
            if (members[i] == _addr) {
                return true;
            }
        }
        return false;
    }
}