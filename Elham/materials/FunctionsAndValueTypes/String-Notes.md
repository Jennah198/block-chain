# Solidity Materials: Strings and Bytes

## Key Concepts
* **bytes32**: Fixed-size byte array. More gas-efficient for strings shorter than 32 characters.
* **string**: Dynamically sized UTF-8 encoded string. Best for long messages or front-end readability.
* **Storage Efficiency**: Long documents are often hashed and stored on services like **IPFS**, with only the hash kept on-chain to save costs.