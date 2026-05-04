// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20; // Matches your compiler version

contract Contract {
    address public owner;

    constructor() payable {
        owner = msg.sender;
        require(msg.value >= 1 ether, "Must send at least 1 ether");
    }

    function withdraw() external {
        require(msg.sender == owner, "Only the owner can withdraw");
        (bool success, ) = owner.call{ value: address(this).balance }("");
        require(success, "Transfer failed");
    }
}