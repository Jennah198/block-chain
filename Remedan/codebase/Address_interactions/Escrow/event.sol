// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    // Event to notify when the escrow is approved
    event Approved(uint balance);

    constructor(address _arbiter, address _beneficiary) payable {
        depositor = msg.sender;
        arbiter = _arbiter;
        beneficiary = _beneficiary;
    }

    // Only the arbiter can approve the release of funds
    function approve() external {
        require(msg.sender == arbiter, "Only arbiter can approve");

        uint balance = address(this).balance;

        (bool success, ) = beneficiary.call{ value: balance }("");
        require(success, "Transfer failed");

        // Emit the event with the amount sent
        emit Approved(balance);
    }
}