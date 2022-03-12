// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.4;
contract MyElection
{
address owner;
uint16 candCount;
uint totalCand;
uint16 voterCount;
/*
address[] candid;
address[] voters;
*/
struct Candidate
{
uint16 id;
uint16 voteCount;
string name;

}

constructor()
{

    owner=msg.sender;
    candCount=0;
    totalCand=2;
}
mapping(uint=>Candidate) candidates;
mapping(address=>bool) voted;
 function addCandidate (string memory _name) external  {
     require(msg.sender==owner);
       candCount++;
        candidates[candCount] = Candidate(candCount, 0,_name);
    }






function vote(uint _candidateId)  public {
        // require that they haven't voted before
        require(!voted[msg.sender],"Can't vote more than than once");

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= totalCand);

        // record that voter has voted
        voted[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount++;

      
    }

    function winner() external  view returns(string memory name)
    {
       if(candidates[1].voteCount>candidates[2].voteCount)
       {
        name= candidates[1].name;
       }
         else 
         {
        name= candidates[2].name;
         }
   
    }
    
}