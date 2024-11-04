// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Gas {

    function loopUnchecked() public pure returns (uint256 sum) {
        for(uint256 n = 0; n < 100;) {
            sum += n;
            unchecked {
                n++;
            }
        }
    }


    function loop() public pure returns (uint256 sum) {
        for(uint256 n = 0; n < 100; n++) {
            sum += n;
        }
    }
}