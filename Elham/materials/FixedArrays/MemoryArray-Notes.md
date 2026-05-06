# Memory Arrays
* **No Push**: Memory arrays do not have a `.push()` member function.
* **Fixed Size**: Once initialized with the `new` keyword, the size is locked for the rest of the transaction.
* **Two-Step Process**: To filter into memory, you must first count the matching elements to determine the array size, then loop again to populate it.
* **Syntax**: `uint[] memory arr = new uint[](size);`.