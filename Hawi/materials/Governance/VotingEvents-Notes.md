Event Purpose: Events allow external applications to respond to smart contract state changes without constantly polling the blockchain.

The emit Keyword: This tells the EVM to write the arguments into the transaction's log section.

Logging Efficiency: It is much cheaper to search for an event log than it is to store and read data from a mapping in a loop on the frontend.

Indexing: In your code, proposals.length is used to capture the ID of the proposal before or during the push to ensure the ID matches the array index.