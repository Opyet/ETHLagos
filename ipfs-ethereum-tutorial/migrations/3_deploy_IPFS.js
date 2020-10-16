var IPFSInbox = artifacts.require("../contracts/IPFSInbox.sol");

module.exports = function(deployer){
    deployer.deploy(IPFSInbox);
};