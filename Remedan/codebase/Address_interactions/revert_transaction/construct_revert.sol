// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract Contract {

    address public owner;

    // Payable constructor that requires at least 1 ether
    constructor() payable {
        require(msg.value >= 1 ether, "Must send at least 1 ether");
        owner = msg.sender;
    }

    receive() external payable { }

    function tip() public payable {
        (bool success, ) = owner.call{ value: msg.value }("");
        require(success);
    }

    function donate() external {
        selfdestruct(payable(msg.sender));   // or payable(owner)
    }
}