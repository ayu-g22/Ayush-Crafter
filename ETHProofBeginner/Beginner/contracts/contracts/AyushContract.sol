// SPDX-License-Identifier: MIT

pragma solidity 0.8.25;

contract AyushContract {

    // declaring the state variables
    // these are linked with the smart contract
    string public tokenName = "Rohit Sharma ";
    string public tokenAbbr = "RS";
    uint public totalSupply = 45;

    // balance mapping
    mapping(address => uint) public balances;

    function mint(address addr, uint amount) external {
        balances[addr] += amount;
        totalSupply += amount;
    }

    function burn(address addr, uint amount) external {
        if(balances[addr]>=amount && totalSupply > amount){
            balances[addr] -= amount;
            totalSupply -= amount;
        }
    }
}