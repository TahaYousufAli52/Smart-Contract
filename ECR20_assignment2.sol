// SPDX-License-Identifier: MIT

pragma solidity ^0.8.5;

// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";
// import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

contract MyToken is ERC20 {
    address public admin;
    constructor() ERC20("MyToken", "TYA") {
        _mint(msg.sender, 1 * 10 ** decimals());
        admin = msg.sender;
    }

    function mint(address to, uint amount) external {
        require(msg.sender == admin, "Only Admin");
        _mint(to, amount);
    }

    //*Implement an extension of ERC20 with a burn function with the burn amount given as input

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    //*Implement another function with taking burn percentage as input
    function burn2(uint256 amount) external {
        _burn(msg.sender, (amount ** decimals())/100);
    }

}