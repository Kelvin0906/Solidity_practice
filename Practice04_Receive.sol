// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.18;
contract PiggyBank{
    constructor() payable {}
    receive() external payable {}
    function withdraw() external{
        address payable receiver = payable(msg.sender);
        receiver.transfer(address(this).balance);   // this : this contract
    }
}

// receive() external payable {...}
// Receive Function will be triggered when a trasaction that doesn't include any calldata
//      is sent to this contract. 
// If the Sender sends Ether using 'send' or 'transfer'.The gas will been limited in 2300.

// addr.transfer(uint256 amout)
//      If the transfer fails.It will trigger a "revert".

// addr.send(uint256 amount) -> bool
//      If the transfer fails.It will return "false".

// msg.sender : It can get the caller address.
