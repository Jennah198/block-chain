# Solidity Materials: The Receive Function

## Key Concepts
* **Payable**: A keyword that enables a function (or contract) to accept Ether.
* **receive()**: A special function that executes when a transaction contains Ether but no `calldata`.
* **msg.value**: The amount of Ether (in Wei) sent with the transaction.
* **Failure**: If a contract does not have a `receive()` or `payable` fallback function, any attempt to send Ether directly to it will cause the transaction to revert.

## Requirements for receive()
* Must be `external`.
* Must be `payable`.
* Cannot accept arguments.
* Cannot return values.