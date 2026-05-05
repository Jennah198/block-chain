// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    address public charity;

    // 1. Modify constructor to accept the charity address
    constructor(address _charity) {
        charity = _charity;
    }

    // Allow the contract to receive ether
    receive() external payable {}

    // 2. Transfer all remaining funds to the charity
    function donate() external {
        // address(this).balance gets the contract's total holdings
        (bool success, ) = charity.call{ value: address(this).balance }("");
        require(success, "Donation failed");
    }
}