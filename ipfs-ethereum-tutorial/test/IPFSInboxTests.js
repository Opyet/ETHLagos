
const IPFSInbox = artifacts.require("IPFSInbox");

contract("IPFSInbox", accounts => {
    it("...should emit an event when you send an IPFS address.",
    async () => {

        //wait for the contract deployment
        const ipfsInbox = await IPFSInbox.deployed();
        //console.log(ipfsInbox);
        
        //set a variable to false, and create an event listener to set it to true if event fires
        eventEmitted = false;
        //var event = ipfsInbox.ipfsSent();
        //var event = ipfsInbox.getPastEvents("ipfsSent");
        await ipfsInbox.ipfsSent((err, res) => {
            eventEmitted = true
        });

        // call the contract function which sends an IPFS address
        await ipfsInbox.sendIPFS(accounts[1], "SampleAddress", { from: accounts[0]});

        assert.equal(eventEmitted, true, 
            "Sending an IPFS request does not emit an event.");
    });
});