
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }

    struct Vote {
        bool choice;
        bool voted;
    }

    Proposal[] public proposals;
    
    // Mapping: proposalId => voterAddress => Vote record
    mapping(uint => mapping(address => Vote)) public votes;

    function newProposal(address _target, bytes calldata _data) external {
        proposals.push(Proposal({
            target: _target,
            data: _data,
            yesCount: 0,
            noCount: 0
        }));
    }

    /**
     * @dev Allows voters to cast or change their vote.
     * Decrements the previous count if the user is switching sides.
     */
    function castVote(uint _proposalId, bool _supports) external {
        Proposal storage proposal = proposals[_proposalId];
        Vote storage userVote = votes[_proposalId][msg.sender];

        // 1. If the user already voted, "undo" their previous choice
        if (userVote.voted) {
            if (userVote.choice) {
                proposal.yesCount--;
            } else {
                proposal.noCount--;
            }
        }

        // 2. Record the new choice and mark as voted
        userVote.choice = _supports;
        userVote.voted = true;

        // 3. Update the counts with the new choice
        if (_supports) {
            proposal.yesCount++;
        } else {
            proposal.noCount++;
        }
    }
}