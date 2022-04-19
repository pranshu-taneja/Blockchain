// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;


struct my_struct{
    //Many ways of defining struct obj or their values --down in the contract
    string name;
    uint roll_n;
}

contract practice2{
    
    my_struct public s1;

    //1st way is by using contructor
    constructor(){
        s1.name = "Pranshu";
        s1.roll_n = 1914355;
    }

    //2nd way is by using function 
    function change(string memory name_, uint roll_n_) pure public returns(my_struct memory){
        my_struct memory object = my_struct({
            name: name_,
            roll_n: roll_n_
        });

        return object;
    }

    //3rd way is fuck it directly
    my_struct public object_11 = my_struct("Fuck it", 777); 


    //function to get the info about block
    function getter() public view returns(uint block_n, uint block_stamp, address add){
        // block.number for block number 
        // block.timestamp for when it was mined
        // msg.sender for the address of the block
        return(block.number, block.timestamp, msg.sender);
    }

}