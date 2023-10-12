// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

interface IERC20 {
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed sender,uint256 value);

    function totalSupply() external view returns(uint256);
    function balacneOf(address account) external view returns(uint256);
    function allowance(address owner, address sender) external view returns(uint256);

    function approve(address spender, uint256 amount) external returns(bool);
    function transfer(address to, uint256 amount) external returns(bool);
    function transferFrom(address from, address to, uint256 amount) external returns(bool);
}

// Interface [name]{...}
// Can't declare "constructor","state variables","modifier".

// https://www.youtube.com/watch?v=IG5dD25Dp4w&list=PLHmOMPRfmOxQYDnXAc1hKY6ra4WDU8ZlM&index=17&ab_channel=Hung-YingTai