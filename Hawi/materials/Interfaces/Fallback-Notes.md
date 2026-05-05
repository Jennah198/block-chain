The Catch-All: The fallback() function is executed when no other function matches the given function identifier.

Data Requirements: Fallback can be triggered by sending data that is less than 4 bytes, more than 4 bytes (if it doesn't match a selector), or completely empty data if no receive() function is defined.

Use Cases: It is commonly used for proxy contracts to forward calls or for contracts to handle unexpected interactions gracefully.

Low-Level call: Using address.call(data) is the standard way to trigger a fallback from another contract.