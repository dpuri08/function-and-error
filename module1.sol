// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;


contract LotteryExample {
    address public owner;
    address[] public participants;

    constructor() {
        owner = msg.sender;
    }

    function joinLottery() public payable {

        require(msg.sender != owner, "Owner cannot join the lottery");
        participants.push(msg.sender);

    // we need atleast 2 member for the lottery to happen
        assert(participants.length > 1);

    // revert statements prevents additional participants to join once the lottery is full
        if (participants.length > 2) {
            revert("Lottery is full");
        }
    }
}
