// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.9;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/IERC20.sol";

contract Swap{
    event input(uint256);

    struct Token {
        address tokenAddress;
        uint256 price;
    }

    address owner;
    Token[] pricefeed;
    //mapping(address => Token) tokenTraker;

    constructor(){
        owner = msg.sender;
    }  

    function RegisterToken(address _addr) public {
        uint256 pricefeedIndex = pricefeed.length;
        pricefeed.push(
            Token({
                tokenAddress: _addr,
                price: 0
            })
        );

        emit input(pricefeedIndex);
    }
    function SetTokenPrice(uint256 feedindex, uint256 setPrice) public{
        require(msg.sender == owner);
        pricefeed[feedindex].price = setPrice;

    }

    function SwapExactTokentoToken (address tokenaddr, address tokenaddr2,address owner1, address owner2,uint tokenvalue1, uint tokenvalue2) public {
        IERC20 exactToken = IERC20(tokenaddr);
        IERC20 token = IERC20(tokenaddr2);

        require(exactToken.allowance(owner1, address(this)) >= tokenvalue1, "You are withdrawing more than your allowance");
        require(token.allowance(owner2, address(this)) >= tokenvalue2, "You are withdrawing more than your allowance");

        exactToken.transferFrom(owner1, owner2, tokenvalue1);
        token.transferFrom(owner2, owner1, (tokenvalue2 * 1/2));
    }
    
}