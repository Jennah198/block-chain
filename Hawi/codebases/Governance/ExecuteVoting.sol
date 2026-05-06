// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        bool executed; // Track if proposal has been carried out
    }

    struct Vote {
        bool choice;
        bool voted;
    }

    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);

    Proposal[] public proposals;
    mapping(uint => mapping(address => Vote)) public votes;
    mapping(address => bool) public members;

    constructor(address[] memory _memberList) {
        members[msg.sender] = true;
        for (uint i = 0; i < _memberList.length; i++) {
            members[_memberList[i]] = true;
        }
    }

    function newProposal(address _target, bytes calldata _data) external {
        require(members[msg.sender], "Only members can create proposals");
        uint proposalId = proposals.length;
        proposals.push(Proposal({
            target: _target,
            data: _data,
            yesCount: 0,
            noCount: 0,
            executed: false
        }));
        emit ProposalCreated(proposalId);
    }

    function castVote(uint _proposalId, bool _supports) external {
        require(members[msg.sender], "Only members can vote");
        
        Proposal storage proposal = proposals[_proposalId];
        Vote storage userVote = votes[_proposalId][msg.sender];

        // Handle vote changes
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

        emit VoteCast(_proposalId, msg.sender);

        // Check for threshold and execution
        if (proposal.yesCount >= 10 && !proposal.executed) {
            proposal.executed = true; // Set to true BEFORE call to prevent reentrancy
            (bool success, ) = proposal.target.call(proposal.data);
            require(success, "Proposal execution failed");
        }
    }
}