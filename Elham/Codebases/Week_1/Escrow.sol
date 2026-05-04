// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    // 1. Declare the Approved event
    event Approved(uint balance);

    constructor(address _arbiter, address _beneficiary) payable {
        depositor = msg.sender; //
        arbiter = _arbiter;
        beneficiary = _beneficiary;
    }

    function approve() external {
        require(msg.sender == arbiter, "Only the arbiter can approve");

        uint balance = address(this).balance;
        
        (bool success, ) = beneficiary.call{value: balance}("");
        require(success, "Transfer to beneficiary failed");

        // 2. Emit the event after a successful transfer
        emit Approved(balance);
    }
}