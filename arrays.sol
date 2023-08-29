// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.21;

contract Arrays {
    uint[] nombre;

    function addValue(uint _value) public {
        nombre.push(_value);
    }

    function updateValue(uint _value, uint index) public {
        require(index < nombre.length, "Index out of bounds");
        nombre[index] = _value;
    }

    function deleteValue(uint index) public {
        require(index < nombre.length, "Index out of bounds");
        if (index < nombre.length - 1) {
            nombre[index] = nombre[nombre.length - 1];
        }
        nombre.pop();
    }

    function getValue(uint index) public view returns (uint) {
        require(index < nombre.length, "Index out of bounds");
        return nombre[index];
    }

    function nombreX2() public view returns (uint[] memory) {
        uint longueur = nombre.length;
        uint[] memory nombreX2 = new uint[](longueur);

        for (uint i = 0; i < longueur; i++) {
            nombreX2[i] = nombre[i] * 2;
        }

        return nombreX2;
    }

    function getNombreLength() public view returns (uint) {
        return nombre.length;
    }
}
