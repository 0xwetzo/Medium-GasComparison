// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../../lib/forge-std/src/Test.sol";
import {Token_ERC20} from "../../mocks/MockERC20.sol";

import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import { Vault1 } from "./Vault1.sol";
import { Vault2 } from "./Vault2.sol";

contract GasTest_2_2 is Test {
    Token_ERC20 public token;
    Vault1 public vault1;
    Vault2 public vault2;

    address alice = vm.addr(0xa11ce);
    uint256 balance = 1 ether;

    function setUp() public {
        token = new Token_ERC20("Token", "TKN", 18);
        vault1 = new Vault1();
        vault2 = new Vault2();

        token.mint(alice, balance);
        token.mint(address(vault1), balance);
        token.mint(address(vault2), balance);
        vm.startPrank(alice);
        token.approve(address(vault1), balance);
        token.approve(address(vault2), balance);
        vm.stopPrank();
    }

    function testVault1() public {
        vm.prank(alice);
        vault1.withdrawAll(IERC20(address(token)));
        assertEq(token.balanceOf(address(vault1)), 0);
        
        vm.prank(alice);
        vault1.deposit(IERC20(address(token)), balance);
        assertEq(token.balanceOf(address(vault1)), balance);
    }

    function testVault2() public {
        vm.prank(alice);
        vault2.withdrawAlmostAll(IERC20(address(token)));
        assertEq(token.balanceOf(address(vault2)), 1);

        vm.prank(alice);
        vault2.deposit(IERC20(address(token)), balance - 1);
        assertEq(token.balanceOf(address(vault2)), balance);
    }
}