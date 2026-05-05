# Solidity Materials: Addresses & msg.sender

## Key Concepts
* **Address Type**: A 160-bit (20-byte) hexadecimal value representing an account or contract.
* **msg.sender**: A global variable that represents the address of the account currently interacting with the contract.
* **Constructor**: A special function that runs only once during deployment. It is the perfect place to initialize state variables like the `owner`.

## Implementation Details
By setting `owner = msg.sender` in the constructor, we permanently (unless changed by other logic) link the contract's administrative power to the deployer's address.