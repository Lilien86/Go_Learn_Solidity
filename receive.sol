// SPDX-License-Identifier: UNLICENSEDs

pragma solidity 0.8.21;

contract test
{
    address lastPerson;
    uint256 balances;

    function getPerson() public view returns (address) 
    {
        return lastPerson;
    }

    function getBlances() public view returns (uint)
    {
        return balances;
    }

    receive() external payable 
    {
        lastPerson = msg.sender;
        balances = balances + msg.value;
    }
}
