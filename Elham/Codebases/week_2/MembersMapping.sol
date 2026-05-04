// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // 1. Create a public mapping from address to bool
    // This allows instant checks for membership status
    mapping(address => bool) public members;

    /**
     * @dev Adds an address to the members mapping.
     * @param _addr The address to be granted membership.
     */
    function addMember(address _addr) external {
        // 2. Set the value to true for the specific key (_addr)
        members[_addr] = true;
    }

    /**
     * @dev Checks if an address is a member.
     * Note: Since the mapping is public, Solidity automatically 
     * creates a getter, but you can also check it manually like this:
     */
    function isMember(address _addr) external view returns (bool) {
        return members[_addr];
    }
}