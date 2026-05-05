# Dynamically Sized Arrays
* **Definition**: Arrays where the size is unknown at compile-time (e.g., `uint[]`).
* **Length**: Use the `.length` member to determine the number of elements at runtime.
* **Access**: Elements are retrieved using numerical indexes (e.g., `array[i]`).
* **Data Location**: Use `calldata` for external function arguments to optimize gas costs.