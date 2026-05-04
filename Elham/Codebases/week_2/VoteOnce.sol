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
     * @dev Creates a new vote. Reverts if the sender has already voted.
     * @param _choice The choice being cast.
     */
    function createVote(Choices _choice) external {
        // 1. Ensure the user hasn't voted yet
        require(!hasVoted(msg.sender), "Address has already cast a vote.");

        // 2. Add the vote to the storage array
        votes.push(Vote(_choice, msg.sender));
    }

    /**
     * @dev Helper function to check if an address has voted.
     * Changed to 'public' so it can be called by 'createVote' internally.
     */
    function hasVoted(address _voter) public view returns (bool) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == _voter) {
                return true;
            }
        }
        return false;
    }

    function findChoice(address _voter) external view returns (Choices) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == _voter) {
                return votes[i].choice;
            }
        }
        revert("Vote not found");
    }
}