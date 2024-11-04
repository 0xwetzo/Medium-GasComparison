// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { Gas } from "../src/Gas.sol";
import { Gas1 } from "../src/Gas1.sol";
import { Gas2 } from "../src/Gas2.sol";

contract GasTest is Test {
    Gas public gasContract;
    Gas1 public gasContract1;
    Gas2 public gasContract2;

    function setUp() public {
        gasContract = new Gas();
        gasContract1 = new Gas1();
        gasContract2 = new Gas2();
    }

    function testGas() view public {
        gasContract.loop();
    }

    function testGasUnchecked() view public {
        gasContract.loopUnchecked();
    }

    function testGas1() view public {
        gasContract1.test();
    }

    function testGas2() view public {
        gasContract2.test();
    }
}