pragma solidity ^0.4.24;

import "./lib/Ownable.sol";

contract RoleEnabled is Ownable {

    address CEO;

    address CFO;

    modifier isCEO(address _address) {
        require(_address == CEO);
        _;
    }

    modifier isCFO(address _address) {
        require(_address == CFO);
        _;
    }

    function setCFO(address _addressCFO) public isCEO(msg.sender) {
        require(CEO != _addressCFO, "CFO must be different to CEO.");
        CFO = _addressCFO;
    }

    function setCEO(address _addressCEO) public onlyOwner() {
        CEO = _addressCEO;
    }

}
