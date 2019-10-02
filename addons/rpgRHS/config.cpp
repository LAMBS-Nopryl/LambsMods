class CfgPatches {
  class lambs_rpgRHS {
    units[] = {};
    weapons[] = {};
    requiredVersion = 1.82;
    requiredAddons[] = {
        "A3_Weapons_F",
        "rhs_c_weapons"
    };
    version = "1.0";
    versionStr = "1.0";
    author = "nkenny";
    authorUrl = "http://www.nopryl.no";
  };
};

class CfgAmmo {
  class rhs_rpg26_rocket;
  class rhs_rpg7v2_pg7vl : rhs_rpg26_rocket {
    aiAmmoUsageFlags = "64 + 128 + 256 + 512";
    airLock = 1; 
    allowAgainstInfantry = 1; 
    cost = 40;
  };
};
 