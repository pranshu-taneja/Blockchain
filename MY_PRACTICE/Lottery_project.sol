// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.12;


contract lottery_application{

    address public manager;
    address payable[] public participents;

    constructor(){
        manager = msg.sender;
    }

    receive() external payable{
        require(msg.value == 1 ether,"Your sent ethers are not enough");
        participents.push(payable(msg.sender));
    }

    function get_part_length() public view returns(uint) {
        require(msg.sender == manager,"Not the owner");
        uint length = participents.length;
        return length;
    }

    function getbalance() public view returns(uint){
        require(msg.sender == manager, "Not the owner");
        return address(this).balance;
    }

    function random_gen() public view returns(uint){        // To create a random number equal to participants length
        return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,participents.length)));
    }

    function selectwinner() public{

        //finding winner
        require(msg.sender == manager, "Not the owner");
        uint ran_dom = random_gen();

        //after finding winner
        uint winner_index = ran_dom % participents.length;
        address payable winner_add;
        winner_add = participents[winner_index];
        

        //sending ether to his account
        winner_add.transfer(getbalance());

        participents=new address payable[](0);      //To reset 
    }

}