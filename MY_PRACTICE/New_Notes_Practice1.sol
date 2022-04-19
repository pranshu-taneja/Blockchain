// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.12;

//best practice is to return everything you do using functions.. just do it!! (like js)
//btw returning "WHOLE" map and dynamic array isn't actually possible

contract practice{


    //--------Some basic concepts of memory type and fun() syntax etc----------

    //by default global/state "var" are private
    string public statevar; //get() is automatically created for public "var" (not set() btw)  
    // three ways of intializing statevar (public and global)
    // 1. by constructor
    // 2. by manual set function
    // 3. at the time of declaration


    // string public statevar = 8;         //---1st way---


    constructor(){                          //---2nd way---
        statevar = "wtf";
    }

    //---3rd way---
    // IMP :- Don't use "MEMORY" with "uint" anywhere "uint[]" is different 
    function setstatevar(string memory string_value) public returns(uint some_value){ //Here the uint in return argument is stored onto stack
        // you can use "pure" "view" "returns"
        // pure for not using any global shit inside function
        // view for only reading the gloabal or public shit
        // returns() for telling what will be the returned type 
        // "Memory" location can only be specified for array/uint[], struct or mapping types (not for a single uint)
        statevar = string_value;

        some_value = 8;
        return some_value;          //Use "return" in fun to let the returns() work
    }


    //------ARRAYS-------
    uint[] public static_arr = [1,2,3];     //get() is automatically created
    uint[] public dynamic_arr;              //get() is automatically created


    //---function to access static_arr values---
    function static_arrfun() public view returns(uint[] memory){   //Here uint[] is array so "memory"
        return static_arr;      //return fucking everything
    }

    //---function to create dynamic_arr values---
    function dynamic_arrfun() public returns(uint[] memory){
        for(uint i=0; i<10; i++){
            dynamic_arr.push(i*2);
        }
        return dynamic_arr;     //Not sure why its not showing the values for dynamic
    }

    //------Maps-------
    mapping(uint=>string) public my_map;

    function set_map(uint number, string memory word) public returns(string memory ans){
        
        my_map[number] = word;

        return(my_map[number]);
    }

    

}