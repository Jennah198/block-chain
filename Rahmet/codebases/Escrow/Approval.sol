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

    function approve() external {
        require(address(this).balance > 0, "No funds to release");

        (bool success, ) = payable(beneficiary).call{
            value: address(this).balance
        }("");

        require(success, "Transfer failed");
    }
}
