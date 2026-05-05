Target Address: This is the contract or wallet that the DAO intends to interact with if the vote passes.

Calldata (bytes): This is the encoded function call and arguments that will be executed on the target address.

Proposal State: By using a struct array, we can track multiple active proposals simultaneously, each with its own independent vote counts.

Initialization: New proposals must start with yesCount and noCount at zero to ensure a fair voting process.