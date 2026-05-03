// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    // This function receives ether and immediately forwards it to owner
    function tip() public payable {
        (bool s, ) = owner.call{ value: msg.value }("");
        require(s);
    }
    
    // Allow contract to receive ether without calling tip (optional)
    receive() external payable {}
}