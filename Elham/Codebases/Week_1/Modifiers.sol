// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    
    uint public a;
    uint public b;
    uint public c;
    
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function setA(uint _a) external onlyOwner {
        a = _a;
    }

    function setB(uint _b) external onlyOwner {
        b = _b;
    }

    function setC(uint _c) external onlyOwner {
        c = _c;
    }
}