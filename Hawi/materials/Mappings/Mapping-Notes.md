Key-Value Pairs: Mappings act like hash tables where a unique key (like an address) points to a specific value (like a bool or uint).

Efficiency: Mappings are the most gas-efficient way to retrieve data because you don't need to loop through an array to find a value.

Default Values: In Solidity, every possible key in a mapping is initialized to its "type default." For a bool, the default value is false; for a uint, it is 0.

No Length: Unlike arrays, mappings do not have a .length property and cannot be iterated over directly.