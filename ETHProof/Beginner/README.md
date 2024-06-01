# ETH_Beginner_proof
This Solidity smart contract creates and manages a basic token named "Rohit Sharma" (RS). It includes functionalities for minting and burning tokens while keeping a detailed record of token creation and balances for different addresses.

```
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
```
### Usage

mint(address _address, uint _supply):
  
  This function generates new tokens by increasing both the total supply and the balance of the designated address. The parameter _address specifies the recipient's address, while _supply indicates the number of tokens to be created.

burn(address _address, uint _supply):
  
This function is used to burn tokens. The _address parameter identifies the sender's address, and _supply specifies the number of tokens to be burned. The function reduces both the total supply and the sender's balance by the specified amount. If the sender's balance is insufficient, an error message is generated.
