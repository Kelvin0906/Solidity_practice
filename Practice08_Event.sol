// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.18;
contract PiggyBank{
    address public owner;
    event Create(address owner, uint value);
    event Receive(address indexed sender, uint value);
    event Withdraw(address indexed owner, uint indexed value);
    modifier onlyOwner(){
        require(msg.sender == owner, "Withdraw Failed,Could withdraw by onwer.");
        _;
    }
    constructor() payable {
        owner = msg.sender; // It only runs during deployment,so sender is who deploys it. 
        emit Create(owner, msg.value);
    }
    receive() external payable {
        emit Receive(msg.sender, msg.value);
    }
    function withdraw() onlyOwner external{
        address payable receiver = payable(msg.sender);
        uint value = address(this).balance;
        receiver.transfer(value);
        emit Withdraw(receiver, value);
    }
}

// declare : event [name](...);
// call : emit [name](...);

// indexed : An indexed Event will be placed in Topics column.Topics include 4 bytes32 columns.
//             The first column puts [keccak(name,.....)].The other column can contain anything and
//             won't be encoded.
// indexed will quicker then Non-indexed.
// Non-indexed