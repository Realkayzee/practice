//SPDX-License-Identifier: GPL-3.0;

pragma solidity 0.8.9;


import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";


contract Link is ERC20("Link Token", "LINK") {

    constructor(address _addr){
        _mint(_addr, 100e18);
    }

}