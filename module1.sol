// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.0;


contract LotteryTicket {
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
