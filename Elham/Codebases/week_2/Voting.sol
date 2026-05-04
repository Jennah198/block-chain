// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // Enum representing the available voting options
    enum Choices { Yes, No }

    // 1. Create the Vote struct
    struct Vote {
        Choices choice;
        address voter;
    }

    // 2. Create a public storage variable of type Vote
    Vote public vote;

    /**
     * @dev Creates a new vote and stores it in the state.
     * @param _choice The choice (Yes or No) being cast.
     */
    function createVote(Choices _choice) external {
        // 3. Create a new instance and store it in the 'vote' storage variable
        vote = Vote(_choice, msg.sender);
    }
}