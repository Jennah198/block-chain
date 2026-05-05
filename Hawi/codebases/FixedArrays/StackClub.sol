// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StackClub {
    // Dynamic array of addresses stored in storage
    address[] public members;

    /**
     * @dev Adds a new member to the top of the stack.
     * @param _newMember The address to add.
     */
    function addMember(address _newMember) external {
        members.push(_newMember);
    }

    /**
     * @dev Checks if an address is currently a member.
     * @param _addr The address to check.
     * @return bool True if the address is in the array, false otherwise.
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