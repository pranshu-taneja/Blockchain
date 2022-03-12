// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.12;


//working on struct arrays AWESOME!!



struct product{
        string name;
        uint id;
    }


contract mycontract{
        product[] public obj;
        uint count =0;


        //how to do it with for loop

            function myinput(string memory NAME, uint ID, uint count) public returns(product memory){
                obj.push(product(NAME, ID));
                return obj[count];
            }

            function getarrobj() public view returns(product[] memory){
                return obj;
            }
}


contract array_of_struct{
    struct person{
        string name;
        uint age;
        uint roll;
    }

    person[] array;

    uint public count;


    function setarr(string memory name__, uint age__, uint roll__ ) public {
        person memory obj=  person({
            name:name__,
            age:age__,
            roll:roll__
        });

        array.push(obj);
        count++;
    }

    function retarr(uint obj_number) public view returns(person memory){
        return array[obj_number];
    }

    function retarrcomplete() public view returns(person[] memory){
        return array;
    }

    function N_of_obj() public view returns(uint){
        return count;
    }
}