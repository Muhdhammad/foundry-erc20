// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import "forge-std/Script.sol";
import "src/OurToken.sol";

contract DeployOurToken is Script {

    uint256 public INITIAL_SUPPLY = 1000 ether;

    function run() external returns(OurToken) {
        vm.startBroadcast();
        OurToken ot = new OurToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return ot;
    }
}