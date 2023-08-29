// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.21;

import '@openzeppelin/contracts/utils/Strings.sol';

contract _library
{
    function concatener(string memory _stringA, uint _numbersA, uint _numbersB) external pure returns (string memory)
    {
        string memory res = string(abi.encodePacked(_stringA, Strings.toString(_numbersA), Strings.toString(_numbersB)));
        return res;
    }
}
