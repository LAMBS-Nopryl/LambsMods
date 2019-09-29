class CfgPatches {
  class lambs_wp {
    units[] = {};
    weapons[] = {};
    requiredVersion = 1.82;
    requiredAddons[] = {
        "A3_Characters_F", 
        "lambs_danger"
    };
    version = "1.2";
    versionStr = "1.2";
    author = "nkenny";
    authorUrl = "http://www.nopryl.no";
  };
};

// compile functions 
#include "cfgFunctions.hpp"
#include "cfgWaypoints.hpp"
