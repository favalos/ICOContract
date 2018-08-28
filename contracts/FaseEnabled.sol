pragma solidity ^0.4.24;

import "./Fase.sol";

contract FaseEnabled is RoleEnabled {

    mapping(string => Fase) nameToFase;

    string currentFase;

    constructor() public {

        currentFase = "FASE1";

        nameToFase["FASE1"] = new Fase("Fase1", true, 50, 365 days);
        nameToFase["FASE2"] = new Fase("Fase2", true, 40, 180 days);
        nameToFase["FASE3"] = new Fase("Fase3", false, 20, 180 days);
        nameToFase["FASE3"] = new Fase("Fase3", false, 0, 90 days);
    }

    function changeFase(string newFase) external isCEO(msg.sender) {
        currentFase = newFase;
    }

    function getCurrentFase() public view returns(string) {
        return currentFase;
    }

}
