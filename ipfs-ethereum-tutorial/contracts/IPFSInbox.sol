pragma solidity >=0.5.0;

contract IPFSInbox{
    // Structures
    mapping(address => string) ipfsInbox;
    
    // Events
    event ipfsSent(string _ipfsHash, address _address);
    event inboxResponse(string response);
    
    // Modifiers
    modifier notFull(string memory _string) {
        bytes memory stringTest = bytes(_string);
        require (stringTest.length == 0);
        _;
    }
    
    // creates contract instance
    constructor() public {}
    
    // takes in the receiver's address and the IPFS address.
    // Places the IPFS address in the receiver's inbox.
    function sendIPFS(address _address, string memory _ipfsHash) notFull(ipfsInbox[_address]) public
    {
        ipfsInbox[_address] = _ipfsHash;
        emit ipfsSent(_ipfsHash, _address);        
    }
    
    // checks inbox and empties it afterwards.
    // Returns an address if there is one, or "Empty Inbox"
    function checkInbox() public {
        string memory ipfs_hash = ipfsInbox[msg.sender];
        if(bytes(ipfs_hash).length == 0){
            emit inboxResponse("Empty inbox");
        }else{
            ipfsInbox[msg.sender] = "";
            emit inboxResponse(ipfs_hash);
        }
    }
    
}