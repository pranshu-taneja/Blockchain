// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.4;

contract MyBank
{
address owner;
struct Account
{

string name;
address acctNum;
uint256 balance;

}


constructor()
{

    owner=msg.sender;
}
mapping(address=>Account) myAccount;

function setAccount(address _addr, string memory _name) external 
{
require(msg.sender==owner,"Not an owner");
myAccount[_addr].acctNum=_addr;
myAccount[_addr].name=_name;
myAccount[_addr].balance=0;

}

function getAccountDetails(address _addr) external view returns (string memory name, uint256 bal)

{
name=myAccount[_addr].name;
bal=myAccount[_addr].balance;


}

function deposit() external payable {
if(msg.value>0)
{
myAccount[msg.sender].balance+=msg.value;
}
}
function withdraw(uint256 amt) external{

    if(myAccount[msg.sender].balance>=amt)
    {
    myAccount[msg.sender].balance-=amt;

    }
}
}