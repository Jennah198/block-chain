# Storage Array Pop and Security
* **Pop Member**: The `.pop()` function removes the last element from a storage array and decreases the `.length` by 1.
* **Constructor**: Used to initialize the club by adding the deployer (`msg.sender`) as the first member.
* **Access Control**: Before allowing an action like `addMember` or `removeLastMember`, we use `isMember` to verify the caller's identity.
* **Stack Logic**: Because we only remove from the end, this strictly follows the LIFO (Last-In-First-Out) principle.