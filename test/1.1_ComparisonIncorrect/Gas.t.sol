// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../../lib/forge-std/src/Test.sol";

import { Gas } from "./Gas.sol";

contract GasTest_1_1 is Test {
    Gas public gasContract;

    function setUp() public {
        gasContract = new Gas();
    }

    function testGas1() view public {
        gasContract.loop();
    }

    function testGas2() view public {
        gasContract.loopUnchecked();
    }
}