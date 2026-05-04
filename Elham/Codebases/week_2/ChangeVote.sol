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
     * @dev Updates an existing vote's choice. Reverts if no vote exists.
     */
    function changeVote(Choices _newChoice) external {
        bool found = false;
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == msg.sender) {
                votes[i].choice = _newChoice;
                found = true;
                break; 
            }
        }
        require(found, "No existing vote found to change.");
    }

    /**
     * @dev Required by the test suite to verify the choice cast by an address.
     */
    function findChoice(address _voter) external view returns (Choices) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == _voter) {
                return votes[i].choice;
            }
        }
        revert("Vote not found");
    }

    /**
     * @dev Required to check if a user has already participated.
     */
    function hasVoted(address _voter) public view returns (bool) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == _voter) {
                return true;
            }
        }
        return false;
    }

    function createVote(Choices _choice) external {
        require(!hasVoted(msg.sender), "Already voted");
        votes.push(Vote(_choice, msg.sender));
    }
}