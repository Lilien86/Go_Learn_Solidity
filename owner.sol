// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.21;

contract Owner
{
    address     owner;
    bool        paused;
    uint        nbr;

    constructor()
    {
        owner = msg.sender; 
    }

    function setPaused(bool _paused) public
    {
        require(msg.sender == owner, "Not The Owner");
        paused = _paused;
    }

    function setNbr(uint _nbr) public
    {
        require(!paused, "Contract Is Not Paused");
        require(msg.sender == owner, "Not The Owner");
        nbr = _nbr;
    }

    function getNbr(uint _nbr) public view returns(uint)
    {
        require(msg.sender == owner, "Not The Owner");
        return _nbr;
    }

    function destroy(address payable _to) public
    {
        require(msg.sender == owner, "Not The Owner");
        selfdestruct(_to);
    }
}
