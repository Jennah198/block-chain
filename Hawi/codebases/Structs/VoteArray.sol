// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    // A public storage array to hold all votes
    Vote[] public votes;

    /**
     * @dev Creates a new vote and adds it to the storage array.
     * @param choice The user's choice from the Choices enum.
     */
    function createVote(Choices choice) external {
        // Create a new Vote struct and push it onto the 'votes' array
        votes.push(Vote(choice, msg.sender));
    }
}