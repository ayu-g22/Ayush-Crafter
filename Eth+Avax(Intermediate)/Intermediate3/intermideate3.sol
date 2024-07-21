// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract RudraIntermediate3 {
    string public tokenName = "Gol Gpappa";
    string public tokenAbbr = "GG";

    address public owner;

    mapping(address => uint) private balances;
    mapping(address => mapping(address => uint)) private allowances;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function getBalance() external view returns (uint) {
        return balances[msg.sender];
    }

    function mint(address to, uint amount) external onlyOwner {
        balances[to] += amount;
    }

    function transferTo(address to, uint amount) external {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    function burn(uint amount) external {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
    }

    function approve(address spender, uint amount) external {
        allowances[msg.sender][spender] = amount;
    }

    function transferFrom(address from, address to, uint amount) external {
        require(balances[from] >= amount, "Insufficient balance");
        require(allowances[from][msg.sender] >= amount, "Allowance exceeded");
        balances[from] -= amount;
        balances[to] += amount;
        allowances[from][msg.sender] -= amount;
    }

    function allowance(address owner, address spender) external view returns (uint) {
        return allowances[owner][spender];
    }
}
