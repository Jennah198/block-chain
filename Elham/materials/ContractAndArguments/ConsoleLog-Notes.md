# Solidity Materials: Using Console.log

## Key Concepts
* **Foundry Console**: By importing `forge-std/console.sol`, we gain access to `console.log()`.
* **Debugging**: Use this to inspect variable values or check if logic blocks are reached.
* **Calldata**: A data location for function arguments that are stored in the transaction data rather than memory or storage.

## Implementation
```solidity
import "forge-std/console.sol";

function winningNumber(uint _number, string calldata _message) external {
    console.log(_message);
}