// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // Define the Enum with your favorite foods
    enum Foods { Pizza, Burger, Pasta, Salad }

    // Create public variables and assign the enum values
    // Enums are 0-indexed: food1 will be 0, food2 will be 1, etc.
    Foods public food1 = Foods.Pizza;
    Foods public food2 = Foods.Burger;
    Foods public food3 = Foods.Pasta;
    Foods public food4 = Foods.Salad;
}