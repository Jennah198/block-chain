// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Importing the base contract (Hero.sol is provided by the environment)
import "./Hero.sol";

/**
 * @dev Mage inherits health and takeDamage from Hero
 */
contract Mage is Hero {
    // Inherits uint public health and function takeDamage(uint)
}

/**
 * @dev Warrior inherits health and takeDamage from Hero
 */
contract Warrior is Hero {
    // Inherits uint public health and function takeDamage(uint)
}