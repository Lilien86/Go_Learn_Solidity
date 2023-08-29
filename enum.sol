// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.21;

contract test
{
    enum stage {order, ship, deliver}

    struct product
    {
        uint _SKU;
        test.stage _stage;
    }

    mapping(address => product) CustomerOrder;

    function Order(address _customer, uint _SKU) public
    {
        product memory p = product(_SKU, stage.order);
        CustomerOrder[_customer] = p;
    }

    function ship(address _customer) public 
    {
        CustomerOrder[_customer]._stage = stage.ship;
    }

    function getSKU (address _customer) public view returns (uint)
    {
        return CustomerOrder[_customer]._SKU;
    }

    function getStage (address _customer) public view returns (stage)
    {
        return CustomerOrder[_customer]._stage;
    }
}
