# Solidity Materials: Returning Values

## Key Concepts
* **`returns` Keyword**: Declared in the function signature to specify the data type being returned (e.g., `returns(uint)`).
* **`return` Keyword**: Used inside the function body to actually output the value and stop function execution.
* **`view` Functions**: Functions that read the state but do not modify it. These do not cost gas when called externally.

## Goal: Add Uint
The task was to create an external view function that adds a parameter to a state variable and returns the result.

### Implementation
```solidity
function add(uint _y) external view returns(uint) {
    return x + _y;
}