// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MockERC20 is ERC20 {
    // Initializing the ERC20 token with a name and symbol
    constructor() ERC20("MockToken", "MCK") {}

    // Function to mint tokens to a specified address
    function mint(address to, uint256 amount) external {
        _mint(to, amount);
    }
}