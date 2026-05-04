// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// The interface acts as a blueprint
interface IHero {
    function alert() external;
}

contract Sidekick {
    /**
     * @dev Alert the hero by casting their address to the IHero interface
     * @param hero The address of the hero contract to alert
     */
    function sendAlert(address hero) external {
        // Cast the address to the interface and call the function
        IHero(hero).alert();
    }
}