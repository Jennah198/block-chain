# Solidity Materials: Pure Functions

## Key Concepts
* **Pure Functions**: Functions that neither read from nor write to the contract state. They are used for logic that depends strictly on inputs.
* **Implicit Returns**: Solidity allows naming the return variable in the function signature (e.g., `returns(uint sum)`). If named, the variable is automatically returned at the end of the function.
* **Gas Efficiency**: Like `view` functions, `pure` functions do not cost gas when called externally from a tool like Ethers.js or a frontend.

## Implementation
```solidity
function double(uint x) external pure returns(uint) {
    return x * 2;
}