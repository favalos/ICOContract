pragma solidity ^0.4.24;

import "./FaseEnabled.sol";
import "./lib/ERC20.sol";

contract Token is ERC20, FaseEnabled {

    string public symbol;

    string public name;

    uint8 public decimals;

    uint public totalSupply;

    mapping (address => uint256) addressToBalance;

    mapping (address => mapping (address => uint256)) allowances;

    constructor(string _symbol, string _name, uint8 _totalSupply) public {

        symbol = _symbol;
        name = _name;
        decimals = 18;
        addressToBalance[owner] = _totalSupply;
        totalSupply = _totalSupply;
    }

    function totalSupply() public view returns(uint) {
        return totalSupply;
    }

    function balanceOf(address _who) public view returns(uint) {
        return addressToBalance[_who];
    }

    function allowance(address _owner, address _spender) public view returns (uint256) {
        require(_spender != address(0));

        return allowances[_owner][_spender];

    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(balanceOf(msg.sender) >= _value);
        require(_to != address(0));

        addressToBalance[msg.sender] = addressToBalance[msg.sender] - _value;
        addressToBalance[_to] = addressToBalance[_to] + _value;
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool) {
        require(balanceOf(msg.sender) >= _value);
        require(_spender != address(0));

        allowances[msg.sender][_spender] = _value;
        return true;
    }

  function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
      require(_to != address(0));
      require(balanceOf(_from) >= _value);
      require(allowances[_from][msg.sender] >= _value);

      addressToBalance[_from] = addressToBalance[_from] - _value;
      addressToBalance[_to] = addressToBalance[_to] + _value;
      allowances[_from][msg.sender] = allowances[_from][msg.sender] - _value;
      return true;
  }


    function () public payable {

        Fase fase = nameToFase[getCurrentFase()];



    }

}
