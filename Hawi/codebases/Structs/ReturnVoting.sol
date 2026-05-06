// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    /**
     * @dev Creates and returns a Vote instance in memory.
     * @param choice The user's choice from the Choices enum.
     * @return A Vote struct instance stored in memory.
     */
    function createVote(Choices choice) external view returns (Vote memory) {
        // We create a temporary instance in memory and return it immediately
        return Vote(choice, msg.sender);
    }
}