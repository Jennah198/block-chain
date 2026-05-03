// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    address public charityAddress;

    constructor(address _charityAddress) {
        charityAddress = _charityAddress;
    }

    receive() external payable { }

    function donate() external {
        // selfdestruct sends all remaining funds to the specified address.
        // We must cast the charityAddress to 'payable' for it to receive the funds.
        selfdestruct(payable(charityAddress));
    }
}