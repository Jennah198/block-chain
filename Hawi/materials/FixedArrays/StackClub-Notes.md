# Stack Data Structure in Solidity
* **Concept**: Last-In-First-Out (LIFO). The most recently added member is the first to be removed.
* **Storage Arrays**: Using `address[]` in storage allows us to maintain a persistent list of members.
* **Membership Check**: Since we are using an array and not a mapping, we must loop through the entire array to see if an address exists.
* **Gas Note**: Looping through an array to check membership (O(n) complexity) becomes expensive as the club grows.