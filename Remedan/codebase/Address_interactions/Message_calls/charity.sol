// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract Contract {

    // Public state variable
    address public owner;
    address public charity;   // Added

    // Constructor now accepts charity address
    constructor(address _charity) {
        owner = msg.sender;
        charity = _charity;
    }

    // Receive Ether without calldata
    receive() external payable {

    }

    // Tip function: sends ETH to the owner
    function tip() public payable {
        (bool success, ) = owner.call{ value: msg.value }("");
        require(success);
    }

    // Donate all funds in the contract to charity
    function donate() external {
        (bool success, ) = charity.call{ value: address(this).balance }("");
        require(success, "Donation failed");
    }
}