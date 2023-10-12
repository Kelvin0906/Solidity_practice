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
    address _owner;
    mapping (address => uint) _balance;
    mapping (address => mapping (address => uint256)) _allowance;

    string _name;
    string _symbol;

    modifier OnlyOwner{
        require(msg.sender == _owner,"Only Contract owner can do this.");
        _;
    }

    constructor(string memory nameInit, string  memory symbolInit){
        _owner = msg.sender;
        _name = nameInit;
        _symbol = symbolInit;
        _balance[msg.sender] = 10000;
        _totalSupply = 10000;
    }


    function name() public view returns(string memory){
        return _name;
    }
    function symbol() public view returns(string memory){
        return _symbol;
    }
    function decimals() public pure returns(uint){
        return 18;
    } 

    function totalSupply() public view returns(uint256){
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

    function mint(address account,uint256 amount) OnlyOwner public  {
        require(account != address(0),"ERROR: address can't be 0.");
        _balance[account] += amount;
        _totalSupply += amount;
        emit Transfer(address(0), account, amount);
    }

    function burn(address account, uint256 amount) public{
        require(account != address(0),"ERROR: address can't be 0.");
        uint accountBalance = _balance[account];
        require(accountBalance >= amount, "ERROR: Your account balance is insufficient.");
        _balance[account] -= amount;
        _totalSupply -= amount;
        emit Transfer(account, address(0), amount);
    }

}


// ERC20 Metadata 
// interface IERC20Metadata {
//      function name() public view returns(string memory);
//      function symbol() public view returns(string memory);
//      function decimals() public view returns(uint8);
// }

// ERC20 mint burn
// interface IERC20{
//      function mint(address account, uint256 amount);
//      function burn(address account, uint256 amount);
// }
//