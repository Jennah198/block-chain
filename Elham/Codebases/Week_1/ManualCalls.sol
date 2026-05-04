// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Sidekick {
    /**
     * @dev Alert the hero manually by sending the function selector
     * @param hero The address of the hero contract
     */
    function sendAlert(address hero) external {
        
        bytes4 selector = bytes4(keccak256("alert()"));

        (bool success, ) = hero.call(abi.encodePacked(selector));
        require(success, "External call failed");
    }
}