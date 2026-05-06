# Solidity Materials: Contract Account & Balance

## Key Concepts
* **address(this)**: Explicitly converts the current contract instance into an address type.
* **address(this).balance**: Retrieves the current Ether balance of the contract in Wei.
* **State Management**: Storing a destination address (like a charity) in the constructor ensures the contract has a predefined target for funds.

## Logic Flow
1. The contract accumulates Ether through the `receive()` function.
2. When `donate()` is called, the contract calculates its own balance and forwards every Wei to the `charity` address using a low-level call.