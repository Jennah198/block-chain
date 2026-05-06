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

    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);

    Proposal[] public proposals;
    mapping(uint => mapping(address => Vote)) public votes;
    
    // Mapping to track authorized members
    mapping(address => bool) public members;

    /**
     * @dev Constructor runs once during deployment.
     * @param _memberList An array of addresses to be granted membership.
     */
    constructor(address[] memory _memberList) {
        // Grant membership to the contract deployer
        members[msg.sender] = true;

        // Grant membership to every address in the provided list
        for (uint i = 0; i < _memberList.length; i++) {
            members[_memberList[i]] = true;
        }
    }

    function newProposal(address _target, bytes calldata _data) external {
        // SECURITY: Check if sender is a member
        require(members[msg.sender], "Only members can create proposals");

        uint proposalId = proposals.length;
        proposals.push(Proposal({
            target: _target,
            data: _data,
            yesCount: 0,
            noCount: 0
        }));

        emit ProposalCreated(proposalId);
    }

    function castVote(uint _proposalId, bool _supports) external {
        // SECURITY: Check if sender is a member
        require(members[msg.sender], "Only members can vote");

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

        emit VoteCast(_proposalId, msg.sender);
    }
}