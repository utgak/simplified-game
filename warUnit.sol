pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;
import 'gameObjectInterface.sol';

contract WarUnit is GameObjectInterface {
    int8 power;

    modifier onlyOwner {
        require(msg.pubkey() == tvm.pubkey(), 1337);
		tvm.accept();
		_;
	}

    function attack(WarUnit object) public onlyOwner view {
        tvm.accept();
        object.takeTheAttack(power);
    }

    function takeTheAttack(int8 _power) external override {
        tvm.accept();

        int8 damage = _power - defence;

        if (damage > 0) {
            lives = lives - (damage);
        }

        if (checkForDeath()) {
            die(msg.sender);
        }
    }

    function getPower() public view returns (int8) {
        tvm.accept();
        return power;
    }

        int8 public lives;
    int8 defence;

    function getDefence() public view returns (int8) {
        tvm.accept();
        return defence;
    }

    function checkForDeath() private view returns(bool) {
        return lives <= 0 ? true : false;
    }

    function die(address enemyAddress) private {
        tvm.accept();
        selfdestruct(enemyAddress);
    }
}