pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;
import 'gameObject.sol';

contract WarUnit is GameObject {
    int8 power;

    function attack(GameObject object) public onlyOwner view {
        tvm.accept();
        object.takeTheAttack(power);
    }

    function getPower() public view returns (int8) {
        tvm.accept();
        return power;
    }
}