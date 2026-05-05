// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Renamed from 'Contract' to 'Voting' to match the test suite expectations
contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }

    Proposal[] public proposals;

    /**
     * @dev Creates a new proposal.
     * @param _target The address that will receive the call.
     * @param _data The calldata to be sent to the target.
     */
    function newProposal(address _target, bytes calldata _data) external {
        proposals.push(Proposal({
            target: _target,
            data: _data,
            yesCount: 0,
            noCount: 0
        }));
    }
}