// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

interface ERC20Interface {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint tokens) external returns (bool success);
    function balanceOf(address tokenOwner) external view returns (uint balance);
    function approve(address spender, uint tokens) external returns (bool success);
    function allowance(address tokenOwner, address spender) external view returns (uint remaining);
    function totalSupply() external view returns (uint);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract ERC20Token is ERC20Interface {
  string public name;
  string public symbol;
  uint8 public decimals;
  uint public totalSupply;
  mapping(address => uint) public balances;
  mapping(address => mapping(address => uint)) public allowed;
  
  constructor(string memory tokenName, string memory tokenSymbol, uint8 decimalPlaces, uint supply) {
    name = tokenName;
    symbol = tokenSymbol;
    decimals = decimalPlaces;
    totalSupply = supply;
    balances[msg.sender] = supply;
  }

  function transfer(address to, uint value) external returns(bool) {
    require(balances[msg.sender] >= value, 'Token balance too low.');
    balances[msg.sender] -= value;
    balances[to] += value;
    emit Transfer(msg.sender, to, value);
    return true;
  }

  function transferFrom(address from, address to, uint value) external returns(bool) {
    uint allowedBalance = allowed[from][msg.sender];
    require(balances[from] >= value && allowedBalance >= value, 'Token balance too low.');
    allowed[from][msg.sender] -= value;
    balances[from] -= value;
    balances[to] += value;
    emit Transfer(from, to, value);
    return true;
  }

  function approve(address spender, uint value) external returns(bool) {
    allowed[msg.sender][spender] = value;
    emit Approval(msg.sender, spender, value);
    return true;
  }

  function allowance(address owner, address spender) external view returns(uint) {
    return allowed[owner][spender];
  }
    
  function balanceOf(address owner) external view returns(uint) {
    return balances[owner];
  }
}
