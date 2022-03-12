// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.12;

//---- Don't delete me------ Doubts
// can we call functions seperatly like in other languages
//---How this is working without any constructor of two argument 
// --- How does the this keyword work in solidity
// msg.sender and require with modifier
// How to send ethers from your rinkeyby account
// storage memory and call data
// delegate call .call function
// doubt here where does the transaction really goes to block or to smart contract




struct person{
        string name;
        uint id;
    }

contract simple{
    constructor(string memory NAME, uint ID){            
        obj.name = NAME;                                 
        obj.id = ID;
    } 

    //---->two ways of intializing a struct variable<-----
    
    //first (simply by default constructor ig)
    person public obj = person("Hey",19123);    

    //second    (through function i.e- user input)
    function setter(string memory NAME, uint ID) public returns(person memory){
        person memory obj2 = person({
            name:NAME,
            id:ID
        });
        obj = obj2;
        return obj;
    }
}