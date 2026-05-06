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
     * @dev Helper function to check if an address has cast a vote.
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
     * @dev Required by your test script to verify the choice cast by an address.
     */
    function findChoice(address _voter) external view returns (Choices) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == _voter) {
                return votes[i].choice;
            }
        }
        revert("Vote not found for this address.");
    }

    function createVote(Choices choice) external {
        require(!hasVoted(msg.sender), "Address has already cast a vote.");
        votes.push(Vote(choice, msg.sender));
    }

    /**
     * @dev Updates the choice for an existing voter.
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

        require(found, "You must cast a vote before you can change it.");
    }
}