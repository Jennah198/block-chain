// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    address public charityAddress;

    // Goal 1: Accept the charity address during deployment
    constructor(address _charityAddress) {
        charityAddress = _charityAddress;
    }

    // Goal 2: Receive funds automatically
    receive() external payable {
        // Funds are now stored in address(this).balance
    }

    // Goal 3: Transfer all remaining funds to the charity
    function donate() external {
        // address(this).balance represents the total ETH held by this contract
        (bool success, ) = charityAddress.call{ value: address(this).balance }("");
        require(success, "Donation failed");
    }
}