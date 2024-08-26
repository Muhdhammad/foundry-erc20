// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import {Test} from "forge-std/Test.sol";
import {DeployOurToken} from "script/DeployOurToken.s.sol";
import {OurToken} from "src/OurToken.sol";

contract OurTokenTest is Test {
    OurToken public ourToken;
    DeployOurToken public deployer;

    address hammad = makeAddr("hammad");
    address alice = makeAddr("Alice");

    uint256 public constant STARTING_BAL = 100 ether;
    uint256 public constant INITIAL_ALLOWANCE = 1000;

    function setUp() public {
        deployer = new DeployOurToken();
        ourToken = deployer.run();

        vm.prank(msg.sender);
        ourToken.transfer(hammad, STARTING_BAL);
    }

    function testHammadBalance() public {
        assertEq(STARTING_BAL, ourToken.balanceOf(hammad));
    }

    function testAllowanceWorks() public {
        // transferfrom
        // we can give permission to someone else to transfer from our account
        // that can be either an externally-owned account or a smart-contract account

        // hammad approves alice to spend on his behalf
        vm.prank(hammad);
        ourToken.approve(alice, INITIAL_ALLOWANCE);

        uint256 transferAmount = 500;

        vm.prank(alice);
        ourToken.transferFrom(hammad, alice, transferAmount);

        /* transfer sets _from whoever calls the function
        // transferFrom can set _from until it is approved 
        ourToken.transfer(alice, transferAmount); */

        assertEq(ourToken.balanceOf(alice), transferAmount);
        assertEq(ourToken.balanceOf(hammad), STARTING_BAL - transferAmount);
    }

    function testAllowanceExceedsBalance() public {
        uint256 transferAmount = INITIAL_ALLOWANCE + 1;

        vm.prank(hammad);
        ourToken.approve(alice, INITIAL_ALLOWANCE);

        vm.prank(alice);
        vm.expectRevert();
        ourToken.transferFrom(hammad, alice, transferAmount);
    }

    function testTransferWorks() public {
        uint256 transferAmount = 10 ether;

        vm.prank(hammad);
        ourToken.transfer(alice, transferAmount);

        assertEq(ourToken.balanceOf(alice), transferAmount);
        assertEq(ourToken.balanceOf(hammad), STARTING_BAL - transferAmount);
    }

    function testTransferExceedsBalance() public {
        uint256 largeAmount = STARTING_BAL + 1 ether;

        vm.prank(hammad);
        vm.expectRevert();
        ourToken.transfer(alice, largeAmount);
    }
}
