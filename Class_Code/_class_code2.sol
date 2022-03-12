// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.22 <0.9.0;
//pragma experimental ABIEncoderV2;
contract BasicStruct
{

uint256 public count;
constructor() 
{
count=0;

}
struct Student
{
string name;
uint256 regID;
string semester;
bool set;
}

struct Subject
{ 
uint256 regID;
uint256 subID;
string subName;
string subgrade;
}
mapping(uint256=>mapping(uint256=>Subject)) subDet;
mapping(uint256=>Student)  studentDet;
function setStuStruct(string memory  _name,uint256 _regID,string memory _semester) external 
{
studentDet[_regID].name=_name;
studentDet[_regID].regID=_regID;
studentDet[_regID].semester=_semester;
studentDet[_regID].set=true;

}
function setSubStruct(uint256 _regID,
string memory _subName,
string memory _subgrade) external 
{
    
subDet[_regID][count].regID=_regID;
subDet[_regID][count].subID=count;
subDet[_regID][count].subName=_subName;
subDet[_regID][count].subgrade=_subgrade;
count++;
}
function getStuStruct(uint256 _regID) external view returns (string memory name,uint256 id ,string memory sem,bool present)
{
name=studentDet[_regID].name;
id=studentDet[_regID].regID;
sem= studentDet[_regID].semester;
present=studentDet[_regID].set;

}
function getSubStruct(uint256 _regID,uint256 _subID) external view returns (uint256 regID,
uint256 subID,
string memory subName,
string memory  subgrade)
{
regID=subDet[_regID][_subID].regID;
subID=subDet[_regID][_subID].subID;
subName= subDet[_regID][_subID].subName;
subgrade=subDet[_regID][_subID].subgrade;
}

struct GradeSheet
{
uint256 regID;
Student s;
Subject[]  subScore;

string res;
}




mapping(uint256=>GradeSheet)  overAllGrade;
function setGradeSheetStruct(uint256 _regID,
string memory _res) external 
{
overAllGrade[_regID].regID=_regID;
overAllGrade[_regID].s=studentDet[_regID];
for(uint i=0; i<=count;i++)
{
overAllGrade[_regID].subScore.push(Subject(subDet[_regID][i].regID,
subDet[_regID][i].subID,subDet[_regID][i].subName,subDet[_regID][i].subgrade));
}
overAllGrade[_regID].res=_res;
}




function getGardeCardStruct(uint256 _regID) external view returns (uint256 regID,
Student memory s,
Subject[] memory t ,
string memory res)
{
    uint256 index=0;
Subject[] memory scores = new Subject[](count);
regID=overAllGrade[_regID].regID;
s=overAllGrade[_regID].s;
for(uint256 i=0;i<count;i++)
{
Subject storage currentSubject = subDet[_regID][i];
scores[index]=(currentSubject);
index++;
}

t=scores;
res=overAllGrade[_regID].res;

}


}