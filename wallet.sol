// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.21;

contract test
{
    struct wallet
    {
        uint256 balances;
        uint256 nbTransactions;
    }

    mapping (address => wallet) Wallet;
    uint256 public totalContractBalance;

    function totalBalance() private view returns (uint256)
    {
        return totalContractBalance;
    }

    function addresseSend() public view returns (uint256)
    {
        return Wallet[msg.sender].balances;
    }

    function drawAllMoney(address payable _to) public
    {
        uint256 _amount = Wallet[msg.sender].balances;

        Wallet[msg.sender].balances = 0;
        totalContractBalance -= _amount;
        _to.transfer(_amount);
    }

    receive() external payable 
    {
        Wallet[msg.sender].balances += msg.value;
        totalContractBalance += msg.value;
        Wallet[msg.sender].nbTransactions += 1;
    }
}
