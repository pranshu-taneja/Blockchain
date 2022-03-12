// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.12;

contract first
{

    uint public statevar;      // can only be intialized by constructor or set function only after declaration

    struct student{
        string name;
        uint _roll_no;
        string section;
    }

    constructor(){
        statevar = 5;
    }

    student obj;

    function setvalues(string memory _name, uint roll, string memory sec) public{
        obj.name = _name;
        obj._roll_no = roll;
        obj.section = sec;
    }

   function getname() public view returns(student memory){
       return obj;
   }

   uint[] public arr;

    function set_val(uint n) public{
        for(uint i=0; i<n; i++){
            arr.push(i+2);
        }
    }
    function get_arr() public view returns(uint[] memory){
        return arr;
    }



}
