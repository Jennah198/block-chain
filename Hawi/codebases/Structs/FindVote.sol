// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;

    function createVote(Choices choice) external {
        votes.push(Vote(choice, msg.sender));
    }

    /**
     * @dev Checks if an address has cast a vote.
     * @param _voter The address to search for.
     * @return bool True if a vote exists for this address.
     */
    function hasVoted(address _voter) external view returns (bool) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == _voter) {
                return true;
            }
        }
        return false;
    }

    /**
     * @dev Finds the choice made by a specific voter.
     * @param _voter The address of the voter.
     * @return Choices The choice associated with that address.
     */
    function findChoice(address _voter) external view returns (Choices) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == _voter) {
                return votes[i].choice;
            }
        }
        // Goal states no need to worry about the case where vote wasn't cast
        return Choices.Yes; 
    }
}