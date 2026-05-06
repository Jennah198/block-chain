// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {

    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    // Public storage array of votes
    Vote[] public votes;

    function createVote(Choices choice) external {
        // Create and store new vote
        votes.push(Vote(choice, msg.sender));
    }
}