Passing Arguments: When inheriting, arguments are passed to the base constructor using parentheses: Contract is Base(args).

Static Initialization: This method is used when the value is known at the time of writing the contract (like 50 and 200).

Multiple Arguments: If the base constructor has multiple parameters, you separate them with commas, just like a standard function call.

Initialization Order: Base constructors are always executed before the derived contract's constructor.