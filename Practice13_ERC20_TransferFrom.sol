// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

interface IERC20 {
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed sender,uint256 value);

    function totalSupply() external view returns(uint256);
    function balacneOf(address account) external view returns(uint256);
    function allowance(address owner, address spender) external view returns(uint256);

    function approve(address spender, uint256 amount) external returns(bool);
    function transfer(address to, uint256 amount) external returns(bool);
    function transferFrom(address from, address to, uint256 amount) external returns(bool);
}

contract ERC20 is IERC20{
    uint256 _totalSupply;
    mapping (address => uint) _balance;
    mapping (address => mapping (address => uint256)) _allowance;
    constructor(){
        _balance[msg.sender] = 10000;
        _totalSupply = 10000;
    }

    function totalSupply() public view returns(uint256){
        //_totalSupply = address(this).balance
        return _totalSupply;
    }
    function balacneOf(address account) public view returns(uint256){
        return _balance[account];
    }

    function transfer(address to, uint256 amount) public returns(bool){
        uint myBalance = _balance[msg.sender];
        require(myBalance >= amount, "Your account balance is insufficient.");
        require(to != address(0), "Address can't be 0.");

        _balance[msg.sender] = myBalance - amount;
        _balance[to] = _balance[to] + amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }

    function allowance(address owner, address spender) public view returns(uint256){
        return _allowance[owner][spender];
    }

    function approve(address spender, uint256 amount) public returns(bool){
        _allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;  
    }

    function transferFrom(address from, address to, uint256 amount) public returns(bool){
        uint256 myAllowance = _allowance[from][msg.sender];
        require(myAllowance >= amount, "Your allowance is insufficient.");
        _allowance[from][msg.sender] = myAllowance - amount;
        emit Approval(from, msg.sender, myAllowance - amount);

        uint256 fromBalance = _balance[from];
        require(fromBalance >= amount, "Your ballance is insufficient."); 
        _balance[from] = _balance[from] - amount;
        _balance[to] = _balance[to] + amount;
        emit Transfer(from, to, amount);
        return true;
    }

}