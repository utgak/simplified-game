pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;
import 'warUnit.sol';

contract Warrior is WarUnit {
    string objectType = 'archer';
    uint8 id;
    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
        power = 10;
        defence = 2;
        lives = 5;
    }
}