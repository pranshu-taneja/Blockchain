// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;


contract A{

    //Its the user to which we will manually send some ehters in 3rd function
    address payable user = payable(0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB);
    
    function rec_pay() payable public{
        //A function creted to receive payments from outside or msg.sender account and then 
        // sending them to our contract to which our contract can use anytime 

    } 

    function balance() public view returns(uint user_bal, address The_caller, uint contract_balance){

        //IMPORTANT POINTS HERE TO UNDERSTAND

        //1. address(address_account).balance is used for getting balance of a specific account
        //2. IMP:- msg.sender {The contract caller} shows you the address who has called
        // the contract at first

        //3. Now here the third argument in return() shows us the balance of your CONTRACT (address(this).balance)
        //  (i.e:- that has received the payment and which you won't find in the address list of remix) 
        // Just rem its not the balance of the account by which you send the ethers to your contract 
       
       
        return(address(user).balance, msg.sender, address(this).balance);
    }
    

    function send_ether() public {
        // its the 3rd function which is sending ethers manually to the users account
        user.transfer(10 ether);
    }


    function simple() view internal returns(address my_add){
        //internal gives you access shit in the derived contracts also..awesome right??
        return(msg.sender);
    }
}

//  INHERITANCE IN SOLIDITY
contract b is A{//derived from contract A

    //if you wanna know about all four visiblities FEATURES then use your Handy notebook 
    address public value = simple();


    // YOu will know each contract has its own balance seperated even when derived just try receiving 
    // by both seperately and check teh balance
    function toreceive() payable public{
        //Just to receive payments by our contract iteself
    }


    function paywithme_too() public {
        // btw payable is only used with addresses who they are GOING TO RECEIVE PAYMENTS
        // not actually them who are going to spent or transact something ik ik not makes sense here
        //Awesome results check it out for sure
        user.transfer(1 ether);
    }
}