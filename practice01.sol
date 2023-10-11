// SPDX-License-Identifier: MIT 
                                //The code above indicates which license is being used.
pragma solidity ^0.8.18; // ^: It supports Solidity version 0.8.18 or higher.
contract practice01{
    // Boolean
    bool public isMerge = true;
    
    // Integer
    int public one = 123; // int =  Signed Integer.The first bits indicate positive or negative.
    uint public two = 234; // unit = Unsigned Integer.
    
    // Address
    address public keAddr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address payable public keAddr_pay = payable(keAddr); // If you want to transfer money to this account.You should add 'payable' before address.

    // Enum
    enum color{ Blue, Red}
    color public Co = color.Red;
}