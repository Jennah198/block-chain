# Solidity Materials: Transferring Funds

## Key Concepts
* **Transferring Ether**: While `transfer()` and `send()` exist, `.call{ value: amount }("")` is the modern standard for sending Ether.
* **Low-Level Call**: The `.call` method returns a boolean (`success`) and a bytes object (data). We check the boolean to ensure the payment went through.
* **require()**: A safety check that reverts the transaction if the condition (success) is not met.

## Logic Flow
1. User calls `tip()` and sends Ether (`msg.value`).
2. The contract receives the Ether into its own balance.
3. The contract immediately forwards that balance to the `owner` address.