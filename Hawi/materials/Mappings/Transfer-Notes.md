State vs. Native Balance: These balances are internal to the contract's storage and do not affect the actual Ether balance of the wallet address.

Atomic Updates: To perform a transfer, you must subtract from the sender and add to the recipient in the same transaction.

Validation Checks:

Active Status: Both parties must be registered (isActive).

Solvency: The sender must have a balance greater than or equal to the transfer amount to avoid underflow errors.

Reversion: If any require check fails, the entire transaction is cancelled, ensuring no tokens are lost or created out of thin air.