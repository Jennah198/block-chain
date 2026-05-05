The super Keyword: This keyword automatically searches for the function in the immediate parent contract. If there are multiple parents (multiple inheritance), it follows the inheritance hierarchy from right to left.

Order of Operations: In our code, we trigger the enemy damage first, then the energy reduction. You can flip this order depending on whether you want the player to "pay" the energy cost before or after the action.

Alternative Syntax: Using Hero.attack(_enemy) would also work and is more explicit, but super is generally preferred as it is more flexible if your contract hierarchy changes later.