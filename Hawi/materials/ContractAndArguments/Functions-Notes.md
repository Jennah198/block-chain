# Solidity Materials: Contract Functions

## Key Concepts
* **External Visibility**: Specifically for calls coming from outside the EVM (like a frontend app or another contract).
* **Gas Efficiency**: `external` is often more gas-efficient than `public` if the function is only intended to be called from the outside.
* **State Modification**: Functions like `increment()` modify the contract's storage, which requires a transaction and costs gas.