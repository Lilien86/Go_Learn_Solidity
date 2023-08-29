// SPDX-License-Identifier: UNLICENSEDs

pragma solidity 0.8.21;

contract test3
{
    struct balance
    {
        uint money;
        uint transaction;
    }

    mapping (address => balance) Balance;

    function getMoney() public view returns (uint) 
    {
        return Balance[msg.sender].money;
    }

    function getTrans() public view returns (uint)
    {
        return Balance[msg.sender].transaction;
    }

    receive() external payable 
    {
        Balance[msg.sender].money += msg.value;
        Balance[msg.sender].transaction += 1;
    }    
}
