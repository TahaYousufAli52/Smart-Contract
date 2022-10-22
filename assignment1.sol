//SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0;

contract A {
    uint public aVar;
    constructor() {
        aVar=50;
    }
    function set_aVar() public {
        aVar = 100;
    }
}

contract B is A {
    uint public bVar;
    constructor() {
        bVar=40;
    }
    function set_bVar() public {
        bVar = 90;
    }
}

contract C is B {
    uint public money;
    constructor() {
        money = 10000;
    }
    function transactMoney(uint _money) public onlyOwner {
        money = _money;
    }
    modifier onlyOwner() {
    require(
    msg.sender == 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, "err"
        );  
    _;
    }

}

contract D is C {

}





