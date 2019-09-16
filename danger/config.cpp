class CfgPatches {
  class lambs_danger {
    units[] = {};
    weapons[] = {};
    requiredVersion = 1.82;
    requiredAddons[] = {
        "A3_Characters_F"
    };
    version = "1.3";
    versionStr = "1.3";
    author = "nkenny";
    authorUrl = "http://www.nopryl.no";
  };
};

// compile functions 
#include "cfgFunctions.hpp"

// add new FSM
class CfgVehicles {
    class CAManBase;
    class SoldierWB: CAManBase {
        fsmDanger = "danger\scripts\lambs_danger.fsm";
    };
    class SoldierEB: CAManBase {
        fsmDanger = "danger\scripts\lambs_danger.fsm";
    };
    class SoldierGB: CAManBase {
        fsmDanger = "danger\scripts\lambs_danger.fsm";
    };
    class Civilian_F : CAManBase {
        fsmDanger = "danger\scripts\lambs_dangerCivilian.fsm";
    }; 
};