pragma solidity 0.4.24;

import './token/erc20/openzeppelin/OpenZeppelinERC20.sol';
import './token/erc20/MintableToken.sol';
import './token/erc20/TimeLockedToken.sol';


contract OldHowdooTest is OpenZeppelinERC20 {

    constructor() public OpenZeppelinERC20(0, "uDOO", 18, "uDOO", false) {

    }

    function balanceOf(address _holders) public view returns(uint256) {
        return 28e18;
    }

}