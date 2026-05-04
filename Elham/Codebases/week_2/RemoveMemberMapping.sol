// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // Mapping that stores membership status
    mapping(address => bool) public members;

    /**
     * @dev Adds an address as a member.
     */
    function addMember(address _addr) external {
        members[_addr] = true;
    }

    /**
     * @dev Removes an address from the club by setting its value to false.
     * @param _addr The address to be removed.
     */
    function removeMember(address _addr) external {
        // O(1) operation: just updating one specific storage slot
        members[_addr] = false;
    }

    /**
     * @dev Checks membership status.
     */
    function isMember(address _addr) external view returns (bool) {
        return members[_addr];
    }
}