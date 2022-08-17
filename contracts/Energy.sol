//SPDX-License-Identifier: GPL-3.0;

pragma solidity 0.8.9;


import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";


contract Energy is ERC20("Energy", "ERG") {

    constructor(){
        _mint(msg.sender, 10000e18);
    }

}