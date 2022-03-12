// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.12;


contract payme{
    address payable user= payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
    //doubt here where does the transaction really goes to block or to smart contract

    function paid() payable public{ // To get ether inside our mined block or to our smart contract so that it can send it to the asked person 

    }

    function getbalance() public view returns(uint){        // balance of our block or maybe smart contract 
        return address(this).balance;
    }

    function sendether() public{            // will send ether to particular address from the block's new savings 
        user.transfer(1 ether);
    }

    function getinfo() public view returns(uint bnm, uint timestamp, address msg_sender, uint balance){
        return(block.number, block.timestamp, msg.sender, address(this).balance);
    }
}



contract smartinfo{
    function getinfo() public view returns(uint bnm, uint timestamp, address msg_sender, uint balance){
        return(block.number, block.timestamp, msg.sender, address(this).balance);
    }
}