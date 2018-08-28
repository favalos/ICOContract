pragma solidity ^0.4.24;

import "./RoleEnabled.sol";

contract Fase is RoleEnabled {

    string name;

    bool restricted;

    address[] allowedBuyers;

    uint8 discount;

    uint8 minContribution;

    int sellHold;

    modifier isRestricted() {
        require(restricted,'The current Fase is not restricted.');
        _;
    }

    constructor(string _name, bool _restricted, uint8 _discount, int _sellHold) public isCEO(msg.sender) {
        name = _name;
        restricted = _restricted;
        discount = _discount;
        sellHold = _sellHold;
    }

    function getName() external view returns(string) {
        return name;
    }

    function addBuyer(address _address) public isRestricted() isCFO(msg.sender) {
        allowedBuyers.push(_address);
    }

    function getDiscount() view public returns(uint8) {
        return discount;
    }

}
