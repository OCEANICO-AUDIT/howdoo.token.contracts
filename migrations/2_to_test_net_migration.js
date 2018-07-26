const Token = artifacts.require("./Howdoo.sol");
const SafeMath = artifacts.require("./../node_modules/openzeppelin-solidity/contracts/math/SafeMath");
const Ownable = artifacts.require("./Ownable.sol");

module.exports = function (deployer, network, accounts) {
    let unlockTokensTime = parseInt(new Date().getTime() / 1000) + 3600 * 24 * 30,
        address = "0xb75037df93E6BBbbB80B0E5528acaA34511B1cD0".toLowerCase(),
        token;


    // if (network == 'rinkeby') {
    // }
    // if (network == 'development') {
    // }

    deployer.deploy(SafeMath, {overwrite: false});
    deployer.link(SafeMath, [
        Token,
    ]); // add other contracts here

    deployer.deploy(Ownable, {overwrite: false});
    deployer.link(Ownable, [
        Token,
    ]);

    deployer.then(function () {
        return deployer.deploy(Token, unlockTokensTime);
    }).then(async () => {
        token = await Token.deployed();
    }).then(async () => {
        console.log("token.updateMintingAgent(address, true);");
        return token.updateMintingAgent(address, true);
    }).then(async () => {
        console.log("token.updateStateChangeAgent(address, true)");
        return token.updateStateChangeAgent(address, true);
    }).then(() => {
        console.log("Finished");
    }) .catch((err) => {
        console.error('ERROR', err)
    });

};