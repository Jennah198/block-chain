Virtual vs. Override: A function marked virtual in a base contract is an open invitation for child contracts to redefine its behavior using the override keyword.

Abstract Contracts: Since Hero is abstract, it cannot be deployed by itself; it serves only as a blueprint for Mage and Warrior.

Enum Access: When an enum is defined inside a base contract, derived contracts access it using the dot notation (e.g., Hero.AttackTypes.Brawl).

Interface Interaction: Passing the Enemy contract as a parameter allows our heroes to interact directly with other objects on the blockchain by calling their external functions, such as takeAttack.