// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Ownable {
    address public owner;

    constructor() {
        // Set the deployer as the initial owner
        owner = msg.sender;
    }

    /**
     * @dev Modifier to restrict function access to the owner.
     */
    modifier onlyOwner() {
        require(msg.sender == owner, "Sender is not the owner");
        _; // This underscore tells Solidity to execute the rest of the function
    }
}

contract Collectible is Ownable {
    uint public price;

    /**
     * @dev Uses the inherited onlyOwner modifier from the Ownable contract.
     */
    function markPrice(uint _price) external onlyOwner {
        price = _price;
    }
}