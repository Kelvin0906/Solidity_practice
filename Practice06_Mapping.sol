// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.18;
contract class{
    mapping(uint => uint) Students;
    
    function update(uint id, uint score) public{
        Students[id] = score;
    }
    function get(uint id) public view returns(uint){
        return Students[id];
    }
}

// mapping(Keytype => ValueType) [Name]
//  KeyType : int,bytes,string,enum
//  ValueType : All,include mapping,structs,array.

// keccak256(key) -> value