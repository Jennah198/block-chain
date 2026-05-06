Memory Requirement: For external and public methods, you must use memory or calldata for return parameters.

Storage Restriction: You cannot use the storage keyword for return parameters because it refers to a persistent location that external callers cannot reach.

Creation: You can instantiate and return a struct in one line using return StructName(arg1, arg2);