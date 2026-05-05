// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    enum Choices { Yes, No }

    // Define the Struct
    struct Vote {
        Choices choice;
        address voter;
    }

    // Create a public storage variable of type Vote
    Vote public vote;

    /**
     * @dev Creates a new vote and stores it in the state variable.
     * @param choice The user's choice from the Choices enum.
     */
    function createVote(Choices choice) external {
        // Instantiate the struct and store it in the 'vote' storage variable
        vote = Vote(choice, msg.sender);
    }
}