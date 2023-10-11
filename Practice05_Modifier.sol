// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.18;
contract PiggyBank{
    address public owner;
    modifier onlyOwner(){
        require(msg.sender == owner, "Withdraw Failed,Could withdraw by onwer.");
        _;
    }
    constructor() payable {
        owner = msg.sender; // It only runs during deployment,so sender is who deploys it. 
    }
    receive() external payable {}
    function withdraw() onlyOwner external{
        address payable receiver = payable(msg.sender);
        receiver.transfer(address(this).balance);   
    }
}

// modifier [Name](...){...}
// _; : It call the oigin code.

// Example
// modifier MO(){
// _; <---- call print("a")
// }
// function test() MO {print("a")}


// require(criteria ,"if false // trigger revert()")