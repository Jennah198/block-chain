// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Task: Receive Ether (Must keep this for testSendEther to pass!)
    receive() external payable {}

    // Task: Transfer Tips (For testTip to pass)
    function tip() public payable {
        (bool success, ) = owner.call{ value: msg.value }("");
        require(success, "Tip failed");
    }
}