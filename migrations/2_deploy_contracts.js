const SimpleWallet = artifacts.require("SimpleWallet");

module.exports = function (deployer) {
  deployer.deploy(SimpleWallet);
};
