// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Voting {

    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        bool executed;
    }

    Proposal[] public proposals;

    // Events
    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);
    event ProposalExecuted(uint proposalId);

    // Members list (sybil resistance)
    mapping(address => bool) public members;

    mapping(uint => mapping(address => bool)) public hasVoted;
    mapping(uint => mapping(address => bool)) public voteChoice;

    // Constructor sets initial members + deployer
    constructor(address[] memory initialMembers) {
        members[msg.sender] = true;

        for (uint i = 0; i < initialMembers.length; i++) {
            members[initialMembers[i]] = true;
        }
    }

    function newProposal(address target, bytes calldata data) external {
        require(members[msg.sender], "Not a member");

        proposals.push(
            Proposal({
                target: target,
                data: data,
                yesCount: 0,
                noCount: 0,
                executed: false
            })
        );

        emit ProposalCreated(proposals.length - 1);
    }

    function castVote(uint proposalId, bool support) external {
        require(members[msg.sender], "Not a member");

        Proposal storage proposal = proposals[proposalId];

        // If already executed, ignore further voting
        require(!proposal.executed, "Already executed");

        // If user already voted before, remove previous vote impact
        if (hasVoted[proposalId][msg.sender]) {
            bool previous = voteChoice[proposalId][msg.sender];

            if (previous) {
                proposal.yesCount--;
            } else {
                proposal.noCount--;
            }
        }

        // Record new vote
        if (support) {
            proposal.yesCount++;
        } else {
            proposal.noCount++;
        }

        hasVoted[proposalId][msg.sender] = true;
        voteChoice[proposalId][msg.sender] = support;

        emit VoteCast(proposalId, msg.sender);

        // Execute if threshold reached
        if (proposal.yesCount >= 10 && !proposal.executed) {
            proposal.executed = true;

            (bool success, ) = proposal.target.call(proposal.data);
            require(success, "Execution failed");

            emit ProposalExecuted(proposalId);
        }
    }
}