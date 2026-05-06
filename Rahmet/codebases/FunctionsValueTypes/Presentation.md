---
marp: true
---

# Solidity Value Types

Let's look at a few important types

```js
contract Example {
  uint a;
  int b;
  bool c;

  enum Choice { Up, Down, Left, Right }
  Choice choice = Choice.Up;
}
```

---

**Unsigned Integer**: A number without a sign (not positive or negative)

```js
contract Example {
  // uint can be declared in steps of 8
  // where the number represents the number of bits
  uint8 x; // 0 -> 255
  uint16 y;

  // uint is an alias for uint256
  uint z1;
  uint256 z2;
}
```

---

**Integer**: A number that could be either positive or negative

```js
contract Example {
  // uint can be declared in steps of 8
  // where the number represents the number of bits
  int8 x; // -128 -> 127
  int16 y;

  // int is an alias for int256
  int z1;
  int256 z2;
}
```

---

**Boolean**: Either `true` or `false`

```js
import "forge-std/console.sol";

contract Example {
  constructor(bool myCondition) {
    if(myCondition) {
      // will log yay if myCondition is true
      console.log("yay!");
    }
  }
}
```

---

**Enum**: Defining options for a value by name

```js
import "forge-std/console.sol";

contract Example {
  enum Choice { Up, Down, Left, Right }

  constructor(Choice choice) {
    if(choice == Choice.Up) {
      console.log("up");
    }
    if(choice == Choice.Down) {
      console.log("down");
    }
  }
}
```

## marp: true

## FUNctions 🕺

You can't spell functions without **fun**! 😆 And you must know the keywords 🔑

```js
contract Example {
  function example1() private pure {
    // private: call me within this contract
    // pure: I cannot read/write to storage
  }
  function example2() internal view {
    // internal: call me within this contract (+ inheritance!)
    // view: I can read from storage, not write
  }
  function example3() public payable {
    // public: call me inside and outside this contract
    // payable: send me some ether!
  }
  function example4() external {
    // external: call me from outside this contract
  }
}
```

---

## Returning values

```js
contract Example {
  uint public sum;

  constructor(uint x, uint y) {
    sum = add(x, y);
  }

  function add(uint x, uint y) private pure returns(uint) {
    return x + y;
  }
}
```
