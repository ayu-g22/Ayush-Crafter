// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

contract AyushErrHandling{

    uint public count=0;

    function testRequire(uint amount) public{
        require(amount > 500,"The inputed amount is greater than 500");
        count++;
    }

    function testRevert(uint amount) public {
        if(!(amount > 500)){
            revert("The amount entered is greater than 500");
        }
        count++;
    }

    function testAssert(uint amount) public{
        assert(amount > 500);
        count++;
    }

 
    }