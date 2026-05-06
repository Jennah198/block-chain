Payable Modifier: Adding payable to a function (including the constructor) is required to allow it to accept Ether. Without it, the transaction will revert if value is sent.

Contract Balance: Any Ether sent during deployment is automatically added to the contract's balance. This balance is stored on the blockchain under the contract's address.

Trustless Deposit: By funding the contract at deployment, the beneficiary and arbiter can verify that the money is already "locked" and ready to be paid out once the service is rendered.