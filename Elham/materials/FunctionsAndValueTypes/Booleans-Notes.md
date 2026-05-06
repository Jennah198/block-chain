# Solidity Materials: Booleans

## Core Concepts
* **Storage Variables**: Variables stored permanently on the blockchain in the contract's storage.
* **Default Values**: Uninitialized booleans hold `0x0`, which translates to `false` in Solidity.
* **Public Keyword**: Adding `public` to a variable declaration automatically creates a "getter" function (e.g., `a()`).

## Syntax Example
```solidity
contract Contract {
    bool public myVariable = true;
}
