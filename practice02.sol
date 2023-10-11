// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.18;
contract hello{
    function hi() public pure returns(string memory){
        return "Hello Ethereum by kevin";
    }

}

// function "FunctionName"[V][SM][returns(.....)]{}
// [V] Visibility:
//      public :　Could be called by anyone.
//      private : Could be called by current contract.
//      internal : Could be called by current contract of inheriting contract.
//      external

// [SM] State Mutability: 
//      pure : This function won't "read" or "write".
//      view : This function is for "read" only.

// [returns (type)]:
