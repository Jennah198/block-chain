Event Declaration: The event keyword defines the structure of the data you want to log. In this case, we log the uint balance.

Emit: The emit keyword is used to actually record the event data onto the blockchain logs during execution.

Off-chain Monitoring: Frontend libraries like Ethers.js or Viem can "listen" for the Approved event to show a success notification to the user as soon as the arbiter signs the transaction.

Gas Efficiency: Logging data via events is significantly cheaper than storing that same data in contract state variables.