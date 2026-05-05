// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Hero {
    uint public health;

    constructor(uint _health) {
        health = _health;
    }
}

contract Mage is Hero(50) {}

contract Warrior is Hero(200) {}
