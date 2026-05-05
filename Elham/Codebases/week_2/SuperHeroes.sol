// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./Hero.sol";

contract Mage is Hero(50) {
    // Override the attack function for Mage
    function attack(Enemy enemy) override public {
        enemy.takeAttack(AttackTypes.Spell);
        super.attack(enemy);
    }
}

contract Warrior is Hero(200) {
    // Override the attack function for Warrior
    function attack(Enemy enemy) override public {
        enemy.takeAttack(AttackTypes.Brawl);
        super.attack(enemy);
    }
}