// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../../lib/forge-std/src/Test.sol";

import { Gas1 } from "./Gas1.sol";
import { Gas2 } from "./Gas2.sol";

contract GasTest_1_2 is Test {
    Gas1 public gasContract1;
    Gas2 public gasContract2;

    function setUp() public {
        gasContract1 = new Gas1();
        gasContract2 = new Gas2();
    }

    function testGas1() view public {
        gasContract1.func();
    }

    function testGas2() view public {
        gasContract2.func();
    }
}