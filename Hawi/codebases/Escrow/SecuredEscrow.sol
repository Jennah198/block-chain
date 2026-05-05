// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    constructor(address _arbiter, address _beneficiary) payable {
        arbiter = _arbiter;
        beneficiary = _beneficiary;
        depositor = msg.sender;
    }

    function approve() external {
        // Access control: only the arbiter can call this
        require(msg.sender == arbiter, "Only the arbiter can approve this transfer");

        uint balance = address(this).balance;
        (bool success, ) = beneficiary.call{value: balance}("");
        require(success, "Transfer failed");
    }
}