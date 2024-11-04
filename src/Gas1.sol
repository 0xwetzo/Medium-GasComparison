// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Gas1 {
    function test() public pure returns (uint256 sum) {
        for(uint256 n = 0; n < 100; n++) {
            sum += n;
        }
    }
}