// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    // 1. Create a public storage array of Vote structs
    Vote[] public votes;

    /**
     * @dev Creates a new vote and appends it to the votes array.
     * @param _choice The choice being cast by the sender.
     */
    function createVote(Choices _choice) external {
        // 2. Create the Vote and push it to the storage array
        votes.push(Vote(_choice, msg.sender));
    }
}