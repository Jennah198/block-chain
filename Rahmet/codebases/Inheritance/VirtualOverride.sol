// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

abstract contract Hero {
    enum AttackTypes {
        Spell,
        Brawl
    }

    uint public health;

    constructor(uint _health) {
        health = _health;
    }

    function attack(address enemy) public virtual;
}

contract Enemy {
    function takeAttack(Hero.AttackTypes attackType) external {}
}

contract Mage is Hero(50) {
    function attack(address enemy) public override {
        Enemy(enemy).takeAttack(AttackTypes.Spell);
    }
}

contract Warrior is Hero(200) {
    function attack(address enemy) public override {
        Enemy(enemy).takeAttack(AttackTypes.Brawl);
    }
}
