// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // Public mapping to track membership
    // Maps address (key) to bool (value)
    mapping(address => bool) public members;

    /**
     * @dev Adds an address to the members mapping.
     * @param _addr The address to be granted membership.
     */
    function addMember(address _addr) external {
        // Store 'true' at the location mapped to the provided address
        members[_addr] = true;
    }

    /**
     * @dev Checks if an address is a member. 
     * Since 'members' is public, Solidity creates a getter automatically, 
     * but we can also check it manually like this:
     */
    function isMember(address _addr) external view returns (bool) {
        return members[_addr];
    }
}