// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    constructor(address _arbiter, address _beneficiary) payable {
        depositor = msg.sender;
        arbiter = _arbiter;
        beneficiary = _beneficiary;
    }

    // Only the arbiter can approve the release of funds
    function approve() external {
        require(msg.sender == arbiter, "Only arbiter can approve");

        (bool success, ) = beneficiary.call{ value: address(this).balance }("");
        require(success, "Transfer failed");
    }
}