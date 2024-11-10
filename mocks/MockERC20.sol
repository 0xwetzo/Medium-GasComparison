// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {MockERC20} from "../lib/forge-std/src/mocks/MockERC20.sol";

contract Token_ERC20 is MockERC20 {
    constructor(string memory name, string memory symbol, uint8 decimals) {
        initialize(name, symbol, decimals);
    }

    function mint(address to, uint256 value) public virtual {
        _mint(to, value);
    }

    function burn(address from, uint256 value) public virtual {
        _burn(from, value);
    }
}