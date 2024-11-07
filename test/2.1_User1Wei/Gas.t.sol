// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../../lib/forge-std/src/Test.sol";

import { MockERC20 } from "../../mocks/MockERC20.sol";
import { Vault1 } from "./Vault1.sol";
import { Vault2 } from "./Vault2.sol";

contract GasTest_2_1 is Test {
    MockERC20 public mockERC20;
    Vault1 public vault1;
    Vault2 public vault2;

    address alice = vm.addr(0xa11ce);
    uint256 balance = 1 ether;

    function setUp() public {
        mockERC20 = new MockERC20();
        vault1 = new Vault1();
        vault2 = new Vault2();

        mockERC20.mint(alice, balance);
        mockERC20.mint(address(vault1), balance);
        mockERC20.mint(address(vault2), balance);
        vm.startPrank(alice);
        mockERC20.approve(address(vault1), balance);
        mockERC20.approve(address(vault2), balance);
        vm.stopPrank();
    }

    function testVault1() public {
        vm.prank(alice);
        vault1.deposit(mockERC20, balance);
        assertEq(mockERC20.balanceOf(alice), 0);

        vm.prank(alice);
        vault1.withdraw(mockERC20, balance);
        assertEq(mockERC20.balanceOf(alice), balance);
    }

    function testVault2() public {
        vm.prank(alice);
        vault2.deposit(mockERC20, balance - 1);
        assertEq(mockERC20.balanceOf(alice), 1);

        vm.prank(alice);
        vault2.withdraw(mockERC20, balance - 1);
        assertEq(mockERC20.balanceOf(alice), balance);
    }
}