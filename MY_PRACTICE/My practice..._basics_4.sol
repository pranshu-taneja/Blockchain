// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.12;

contract sample_enum{
    enum user{sunday, monday, tuesday, wednesday, thursday, friday, saturday}
    user day_number = user.sunday;

    function day_count() public view returns(user){
        return day_number;
    }
    

    function change() public {
        if(day_number == user.sunday){
            day_number = user.tuesday;
        }
        if(day_number == user.tuesday){
            day_number = user.wednesday;
        }
    }
}


contract maps{
    struct person{
        string name;
        uint roll;
    }

    mapping(string=>person) public mymap;

    person[] array;

    uint public count;


    function setarr(string memory name__, uint roll__ ) public {
        person memory obj=  person({
            name:name__,
            roll:roll__
        });

        array.push(obj);
        mymap[name__] = array[count];
        count++;
    }

    function getmap(string memory key_name) public view returns(person memory){     //No need as mapping public already creates this
        return mymap[key_name];
    }
}
