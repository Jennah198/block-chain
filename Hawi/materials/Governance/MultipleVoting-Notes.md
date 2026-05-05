Nested Mapping Necessity: To handle vote changes, we must store the relationship between a proposalId and the msg.sender specifically.

The "Undo" Pattern: In blockchain state management, when an entry is updated, you must manually manage the associated counters (decrementing the old before incrementing the new).

Memory vs. Storage: We use storage pointers for both the proposal and the userVote to ensure that our logic updates the actual blockchain state.