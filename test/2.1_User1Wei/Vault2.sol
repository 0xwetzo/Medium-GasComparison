// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Vault2 {
    function deposit(IERC20 token, uint amount) public {
        token.transferFrom(msg.sender, address(this), amount);
    }
    function withdraw(IERC20 token, uint amount) public {
        token.transfer(msg.sender, amount);
    }
}