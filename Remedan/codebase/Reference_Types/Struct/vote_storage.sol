// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {

    // Example enum (assumed to exist)
    enum Choices { Yes, No }

    // Step 1: Create struct
    struct Vote {
        Choices choice;
        address voter;
    }

    // Step 2: Storage variable
    Vote public vote;

    // Step 3: Create a vote
    function createVote(Choices _choice) external {
        vote = Vote(_choice, msg.sender);
    }
}