The Shortcut: abi.encodeWithSignature combines the keccak256 hashing and abi.encode into one step.

Canonical Types: You must use uint256 instead of uint inside the signature string. Even though they are aliases in Solidity code, the ABI encoding requires the full type name to calculate the correct hash.

Argument Passing: Arguments are passed after the signature string as a comma-separated list.

Return Type: Unlike the manually sliced bytes4 from the previous stage, this method returns a dynamic bytes array containing both the selector and the encoded data