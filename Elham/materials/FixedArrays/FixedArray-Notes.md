# Fixed Size Arrays
* **Definition**: Arrays with a length determined at compile-time (e.g., `uint[5]`).
* **Constraints**: They cannot grow or shrink in size.
* **Data Location**: Use `calldata` for external function arguments to save gas.
* **Logic**: Iterating through the array using a `for` loop to calculate a sum.