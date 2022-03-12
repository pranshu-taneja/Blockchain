// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
contract MyMapping{
mapping(address=>uint256) score;
mapping(address=>bool) setOrNot;
bool check=false;
 constructor()
 {
score[msg.sender]=10;

 }
 function setScore(address addr, uint256 scr) public {
score[addr]=scr;
setOrNot[addr]=true;

 }
function getScore(address addr) public  view returns (uint256 scoreV)
{
scoreV=score[addr];


}
function testIf(address addr) public returns (bool)
{
require(setOrNot[addr]==true,"Score Not Set");
if(score[addr]>15){
check=true;

}
return check;

}



}