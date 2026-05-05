// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./Hero.sol";

/**
 * @dev Mage inherits Hero and initializes health to 50
 */
contract Mage is Hero(50) {
    // Hero's constructor is called with 50
}

/**
 * @dev Warrior inherits Hero and initializes health to 200
 */
contract Warrior is Hero(200) {
    // Hero's constructor is called with 200
}