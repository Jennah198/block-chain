// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract StackClub {

    address[] public members;

    // Constructor: add deployer as first member
    constructor() {
        members.push(msg.sender);
    }

    // Modifier to restrict access to members only
    modifier onlyMember() {
        require(isMember(msg.sender), "Not a member");
        _;
    }

    // Add new member (only existing members allowed)
    function addMember(address newMember) external onlyMember {
        members.push(newMember);
    }

    // Remove last member (only existing members allowed)
    function removeLastMember() external onlyMember {
        require(members.length > 0, "No members to remove");
        members.pop();
    }

    // Check membership
    function isMember(address user) public view returns (bool) {
        for (uint i = 0; i < members.length; i++) {
            if (members[i] == user) {
                return true;
            }
        }
        return false;
    }
}