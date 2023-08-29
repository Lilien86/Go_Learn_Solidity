// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.21;

contract test
{
    struct student 
    {
        string name;
        string surnam;
        uint[] note;
    }

    mapping(address => student) Students;

    function addNote(address _student, uint _note) public 
    {
        Students[_student].note.push(_note);
    }

    function getNote(address _student) public view returns (uint[] memory)
    {
        return Students[_student].note;
    }

    function setName(address _student, string memory _name) public 
    {
        Students[_student].name = _name;
    }

    function getName(address _student) public view returns (string memory)
    {
        return Students[_student].name;
    }
}
