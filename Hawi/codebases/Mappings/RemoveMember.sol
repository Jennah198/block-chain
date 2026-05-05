// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    mapping(address => bool) public members;

    function addMember(address _addr) external {
        members[_addr] = true;
    }

    function isMember(address _addr) public view returns (bool) {
        return members[_addr];
    }

    /**
     * @dev Removes a member by setting their mapping value to false.
     * @param _addr The address to be removed from membership.
     */
    function removeMember(address _addr) external {
        // Simple assignment to false "removes" the member logic-wise
        members[_addr] = false;
    }
}