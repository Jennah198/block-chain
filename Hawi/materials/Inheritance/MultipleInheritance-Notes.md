Comma-Separated Inheritance: You can list multiple parent contracts using is Base1, Base2.

Hierarchical Access: Because Transferable itself inherits Ownable, it already has access to the owner variable and the onlyOwner modifier.

The "Diamond Problem": Solidity handles multiple inheritance by using a specific order (C3 Linearization). The rule of thumb is to list parents from "most base-like" to "most derived-like."

Ownership Transfer: By calling transfer, the owner state variable is updated. Since both Collectible and Transferable share the same Ownable state, changing it in one affects the entire contract instance.