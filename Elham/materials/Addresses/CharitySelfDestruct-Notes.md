Solidity Materials: The SELFDESTRUCT Opcode
Key Concepts
Definition: selfdestruct is a built-in Solidity function that permanently removes a contract's bytecode and storage from the Ethereum Virtual Machine (EVM).

Automatic Transfer: When triggered, the contract's entire Ether balance is automatically forwarded to the specified recipient address.

The "Kill Switch": It acts as a finalization tool for a contract's lifecycle, ensuring that no further interactions can occur once its purpose (like a final donation) is met.

Address Casting: For the operation to execute, the recipient address must be explicitly cast to address payable (e.g., payable(charity)).

Blockchain Hygiene: Removing unused contracts helps clean up the blockchain state and may even provide a gas refund to the caller.