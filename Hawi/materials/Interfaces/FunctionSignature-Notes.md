Manual Calls: When an interface isn't available, you can use .call() to send raw data to a contract.

The Selector: The "Function Selector" is the first 4 bytes of the hashed signature. This is how the EVM knows which function you are trying to execute.

Signature Rules: The string passed to keccak256 must contain the function name and parameter types with no spaces. For a function with no arguments, use empty parentheses: "alert()".

abi.encodePacked: This utility is used to concatenate the signature into a format the .call() method can process.
