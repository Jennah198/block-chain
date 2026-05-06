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
        selfdestruct(payable(owner));
    }

    // New function: Only owner can withdraw all funds
    function withdraw() external {
        require(msg.sender == owner, "Only owner can withdraw");
        
        (bool success, ) = owner.call{ value: address(this).balance }("");
        require(success, "Withdrawal failed");
    }
}