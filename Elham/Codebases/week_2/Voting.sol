// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        bool executed; // Track if the proposal has been triggered
    }

    struct Vote {
        bool voted;
        bool choice; 
    }

    Proposal[] public proposals;
    mapping(uint => mapping(address => Vote)) public votes;
    mapping(address => bool) public members;

    constructor(address[] memory _initialMembers) {
    members[msg.sender] = true;
    for (uint i = 0; i < _initialMembers.length; i++) {
        // Access the address at index 'i', don't use 'i' itself
        members[_initialMembers[i]] = true;
        }
    }

    modifier onlyMembers() {
        require(members[msg.sender], "Not a member");
        _;
    }

    function newProposal(address _target, bytes calldata _data) external onlyMembers {
        proposals.push(Proposal({
            target: _target,
            data: _data,
            yesCount: 0,
            noCount: 0,
            executed: false
        }));
    }

    function castVote(uint _proposalId, bool _supportsProposal) external onlyMembers {
        Proposal storage proposal = proposals[_proposalId];
        Vote storage userVote = votes[_proposalId][msg.sender];

        // 1. Manage existing vote counts
        if (userVote.voted) {
            if (userVote.choice) {
                proposal.yesCount--;
            } else {
                proposal.noCount--;
            }
        }

        // 2. Update user status and counts
        userVote.voted = true;
        userVote.choice = _supportsProposal;

        if (_supportsProposal) {
            proposal.yesCount++;
        } else {
            proposal.noCount++;
        }

        // 3. Execution Logic
        // Check if we hit 10 "Yes" votes and haven't executed yet
        if (proposal.yesCount >= 10 && !proposal.executed) {
            proposal.executed = true; // Mark executed BEFORE the call to prevent reentrancy
            
            (bool success, ) = proposal.target.call(proposal.data);
            require(success, "Execution failed");
        }
    }
}