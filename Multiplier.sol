pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

contract Multiplier {
    uint public product = 1;

    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }

    modifier checkOwnerAndAccept {
	require(msg.pubkey() == tvm.pubkey(), 102);
	tvm.accept();
	_;
    }
    
    function multiply(uint8 value) public checkOwnerAndAccept {
        require(value >= 1 && value <= 10);
        product *= value;
    }
}
