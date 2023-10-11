// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.18;
contract A{
    int public I = 1234;
    uint public U;
    string public S = "Hello,Kevin";
    constructor(int _I, uint _U, string memory _S){
        I = _I;
        U = _U;
        S = _S;
    }
}

// Constructor is used for setting initial values,such as sender's address.