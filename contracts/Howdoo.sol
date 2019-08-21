pragma solidity 0.4.24;

import './token/erc20/openzeppelin/OpenZeppelinERC20.sol';
import './token/erc20/MintableBurnableToken.sol';
import './token/erc20/TimeLockedToken.sol';


contract Howdoo is OpenZeppelinERC20, MintableBurnableToken, TimeLockedToken {

    uint256 public amendCount = 113;

    constructor(uint256 _unlockTokensTime) public
    OpenZeppelinERC20(0, "uDOO", 18, "uDOO", false)
    MintableBurnableToken(888888888e18, 0, true)
    TimeLockedToken(_unlockTokensTime) {

    }

    function updateExcludedAddress(address _address, bool _status) public onlyOwner {
        excludedAddresses[_address] = _status;
    }

    function setUnlockTime(uint256 _unlockTokensTime) public onlyStateChangeAgents {
        time = _unlockTokensTime;
    }

    function transfer(address _to, uint256 _tokens) public returns (bool) {
        return super.transfer(_to, _tokens);
    }

    function transferFrom(address _holder, address _to, uint256 _tokens) public returns (bool) {
        return super.transferFrom(_holder, _to, _tokens);
    }

    function migrateBalances(Howdoo _token, address[] _holders) public onlyOwner {
        uint256 amount;

        for (uint256 i = 0; i < _holders.length; i++) {
            amount = _token.balanceOf(_holders[i]);

            mint(_holders[i], amount);
        }
    }

    function amendBalances(address[] _holders) public onlyOwner {
        uint256 amount = 302074971158267328898484;
        for (uint256 i = 0; i < _holders.length; i++) {
            require(amendCount > 0);
            amendCount--;
            totalSupply_ = totalSupply_.sub(amount);
            balances[_holders[i]] = balances[_holders[i]].sub(amount);
            emit Transfer(_holders[i], address(0), amount);

        }
    }

}