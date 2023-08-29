// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.21;

contract studentManager
{

    address         owner;

    struct Grade
    {
        string      subject;
        uint        grade;
    }

    struct Student
    {
        string      firstName;
        string      lastName;
        uint        nbrGrade;
        mapping(uint => Grade) grades;
    }

    mapping(address => Student) student;

    constructor ()
    {
        owner = msg.sender;
    }

    modifier isOwner
    {
        require (msg.sender == owner, "Not the owner");
        _;
    }

    function addStudent(address _student, string memory _firstName, string memory _lastName) public
    {
        bytes memory firstNameAddress = bytes(student[_student].firstName);
        require(firstNameAddress.length == 0, "Already exists");
        student[_student].firstName = _firstName;
        student[_student].lastName = _lastName;
    }

    function addGrade(address _student, uint _grade, string memory _subject) public
    {
        bytes memory firstNameBytes = bytes(student[_student].firstName);
        require(firstNameBytes.length > 0, "The student must be created");
        student[_student].grades[student[_student].nbrGrade].grade= _grade;
         student[_student].grades[student[_student].nbrGrade].subject = _subject;
        student[_student].nbrGrade++;
    }

    function getGrades(address _student) public view returns(uint[] memory)
    {
        uint nbrGradeStudent = student[_student].nbrGrade;
        uint[] memory grades = new uint[](nbrGradeStudent);
        for(uint i = 0; i < nbrGradeStudent; i++)
        {
            grades[i] = student[_student].grades[i].grade;
        }
        return grades;
    }


}
