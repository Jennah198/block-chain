// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;

    /**
     * @dev Checks if an address has already cast a vote.
     * @param _voter The address to check for.
     * @return bool True if a vote exists for this address.
     */
    function hasVoted(address _voter) external view returns (bool) {
        for (uint i = 0; i < votes.length; i++) {
            // Accessing the .voter property of the struct at index i
            if (votes[i].voter == _voter) {
                return true;
            }
        }
        return false;
    }

    /**
     * @dev Finds the choice cast by a specific address.
     * @param _voter The address of the voter.
     * @return Choices The Choice (Yes/No) associated with that address.
     */
    function findChoice(address _voter) external view returns (Choices) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == _voter) {
                // Accessing the .choice property of the struct at index i
                return votes[i].choice;
            }
        }
        // Requirement: No need to worry about the case where a vote was not cast.
        // However, Solidity requires a return path. 
        return Choices.Yes; 
    }

    // Helper to populate data for your testing
    function createVote(Choices _choice) external {
        votes.push(Vote(_choice, msg.sender));
    }
}