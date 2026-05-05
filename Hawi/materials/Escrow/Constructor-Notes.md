Deployment Roles: The constructor allows the depositor (the one deploying) to set the arbiter and beneficiary immediately.

Immutable Logic: Once deployed, these addresses are locked into the contract's storage.

msg.sender: We use this global variable to automatically assign the depositor role to whoever pays the gas to deploy the contract.

Parameter Passing: In Solidity, constructor arguments are passed at the moment of deployment, ensuring the contract is never in an "uninitialized" state.