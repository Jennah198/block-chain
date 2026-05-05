// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {
    function makeContact(address hero) external {
        // Sending arbitrary data that doesn't match any function signature
        (bool success, ) = hero.call(abi.encode("trigger fallback"));
        require(success);
    }
}