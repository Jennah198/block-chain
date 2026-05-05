// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StackClub {
    address[] public members;

    // Add the deployer as the first member
    constructor() {
        members.push(msg.sender);
    }

    /**
     * @dev Checks if an address is a member.
     */
    function isMember(address _addr) public view returns (bool) {
        for (uint i = 0; i < members.length; i++) {
            if (members[i] == _addr) {
                return true;
            }
        }
        return false;
    }

    /**
     * @dev Adds a member. Restricted to existing members.
     */
    function addMember(address _newMember) external {
        require(isMember(msg.sender), "Only members can add others");
        members.push(_newMember);
    }

    /**
     * @dev Removes the most recent member. Restricted to existing members.
     */
    function removeLastMember() external {
        require(isMember(msg.sender), "Only members can remove others");
        members.pop();
    }
}