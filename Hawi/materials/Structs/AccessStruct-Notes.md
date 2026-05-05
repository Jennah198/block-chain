Dot Notation: Use .property to access specific fields within a struct (e.g., votes[i].voter).

Array Search: To find a specific struct in an array, you must iterate through the array using a for loop and compare the target value.

View Functions: These functions do not modify the state, so they are marked as view to save gas for the caller.

Code Reusability: Using a private helper function to find a struct index can reduce code duplication between hasVoted and findChoice.