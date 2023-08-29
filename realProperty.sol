// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.21;

contract Owner
{
    address owner;

    constructor ()
    {
        owner = msg.sender;
    }

    modifier isOwner()
    {
        require(msg.sender == owner, "Not the owner");
        _;
    }
}

contract realProperty is Owner
{
    enum typeProperty {land, apartment, house} //differen type of properties

    struct Property
    {
        uint    price;
        uint    id;
        string  name;
        typeProperty _property;
    }

    uint    counter;//numbers of properties

    mapping(address => Property[]) Possession;

    function addProperty (address _proprietor, string memory _name, uint _price, typeProperty _typeProperty) public isOwner
    {
        require(_price > 1000, "The price must be over 1000");
        require((uint(_typeProperty) >= 0 || uint(_typeProperty) <= 2), "property type must be in 2 and 0");
        Possession[_proprietor].push(Property(counter, _price, _name, _typeProperty));
        counter++;
    }

    function getProperty(address _proprietor) public view isOwner returns(Property[] memory)
    {
        return Possession[_proprietor];
    }

    function getNbrProperty(address _proprietor) public view isOwner returns(uint)  
    {
        return Possession[_proprietor].length;
    }

}
