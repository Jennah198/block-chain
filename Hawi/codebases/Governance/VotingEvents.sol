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

    // 1. Define the Events
    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);

    Proposal[] public proposals;
    mapping(uint => mapping(address => Vote)) public votes;

    function newProposal(address _target, bytes calldata _data) external {
        uint proposalId = proposals.length;
        
        proposals.push(Proposal({
            target: _target,
            data: _data,
            yesCount: 0,
            noCount: 0
        }));

        // 2. Emit when a proposal is created
        emit ProposalCreated(proposalId);
    }

    function castVote(uint _proposalId, bool _supports) external {
        Proposal storage proposal = proposals[_proposalId];
        Vote storage userVote = votes[_proposalId][msg.sender];

        if (userVote.voted) {
            if (userVote.choice) {
                proposal.yesCount--;
            } else {
                proposal.noCount--;
            }
        }

        userVote.choice = _supports;
        userVote.voted = true;

        if (_supports) {
            proposal.yesCount++;
        } else {
            proposal.noCount++;
        }

        // 3. Emit whenever a vote is cast (or changed)
        emit VoteCast(_proposalId, msg.sender);
    }
}