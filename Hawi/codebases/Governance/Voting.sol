// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }

    Proposal[] public proposals;

    function newProposal(address _target, bytes calldata _data) external {
        proposals.push(Proposal({
            target: _target,
            data: _data,
            yesCount: 0,
            noCount: 0
        }));
    }

    /**
     * @dev Updates the vote counts for a specific proposal.
     * @param _proposalId The index of the proposal in the array.
     * @param _supports Whether the voter supports the proposal.
     */
    function castVote(uint _proposalId, bool _supports) external {
        // Retrieve the proposal from storage using its ID (index)
        Proposal storage proposal = proposals[_proposalId];

        // Increment the appropriate counter based on the vote
        if (_supports) {
            proposal.yesCount++;
        } else {
            proposal.noCount++;
        }
    }
}