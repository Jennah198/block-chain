# Solidity Smart Contracts

## Overview
This project contains a set of Solidity smart contracts demonstrating core blockchain concepts such as governance, inheritance, access control, and secure state management.

## Features
- DAO-style voting system with proposals and execution
- Ownership control using `Ownable` pattern
- Ownership transfer via `Transferable` contract
- Contract inheritance and function overriding
- Event-based logging for frontend integration

## Core Contracts
- `Voting.sol` – Proposal creation, voting, and execution logic
- `Ownable.sol` – Access control (owner-only actions)
- `Transferable.sol` – Ownership transfer functionality
- `Hero.sol` / `SuperHeroes.sol` – Inheritance and polymorphism examples

## Tech Stack
- Solidity ^0.8.20
- EVM-compatible smart contracts

## Key Concepts
- Smart contract inheritance
- Modifiers and access control
- Event emission
- Low-level contract execution (`call`)
- Basic DAO governance logic

## Setup
```bash
npm install
npx hardhat compile
npx hardhat test
