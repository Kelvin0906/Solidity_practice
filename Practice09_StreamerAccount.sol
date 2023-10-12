// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract StreamerAccount{
    address internal owner;
    uint balance;
    mapping(address => uint) donorRecord;

    event ReceiveEvent(address indexed sender,uint indexed value);
    event WithdrawEvent(address indexed owner,uint indexed value);
    
    modifier OnlyOwner{
        require(msg.sender == owner, "Only the owner can use it.");
        _;
    }

    constructor() payable {
        owner = msg.sender;
    }
    function donate() public payable {
        donorRecord[msg.sender] += msg.value;
        emit ReceiveEvent(msg.sender, msg.value);
    }

    function Withdraw(uint value) OnlyOwner external { // Only payable function can use msg.value. 
        require(value <= address(this).balance,"Your account balance is insufficient.");
        address payable receiver  = payable(msg.sender);
        receiver.transfer(value); 
        emit WithdrawEvent(msg.sender, value);
    }

    function donateRecord() public view returns(uint){
        address donorAddr = msg.sender;
        return donorRecord[donorAddr];
    }

    function showBalnce() OnlyOwner external returns (uint) {
        balance = address(this).balance;
        return balance;
    }

    function getdonorLevel() public view returns(string memory) {
        uint record = donorRecord[msg.sender];
        if (record > 10 ether){
            return "UR";
        }else if (record > 5 ether){
            return "SR";
        }else if (record > 1 ether){
            return "R";
        }else if (record > 0){
            return "N";
        }else{
            return"None";
        }
    }

}