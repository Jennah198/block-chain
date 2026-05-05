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
     * @dev Checks if an address has cast a vote.
     * Changed to public so it can be called by createVote.
     */
    function hasVoted(address _voter) public view returns (bool) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == _voter) {
                return true;
            }
        }
        return false;
    }

    /**
     * @dev Creates a vote, but only if the sender hasn't voted yet.
     * @param choice The user's choice.
     */
    function createVote(Choices choice) external {
        // Step 1: Validate that the sender has not voted yet
        require(!hasVoted(msg.sender), "Address has already cast a vote.");

        // Step 2: If the check passes, push the new vote
        votes.push(Vote(choice, msg.sender));
    }

    function findChoice(address _voter) external view returns (Choices) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == _voter) {
                return votes[i].choice;
            }
        }
        return Choices.Yes;
    }
}