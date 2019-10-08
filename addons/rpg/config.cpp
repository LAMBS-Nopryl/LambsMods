class CfgPatches
{
  class lambs_rpg
  {
    units[] = {};
    weapons[] = {};
    requiredVersion = 1.82;
    requiredAddons[] = {
        "A3_Weapons_F_Exp",
        "A3_Weapons_F"
    };  //"A3_Weapons_F_Tank"
    version = "1.0";
    versionStr = "1.0";
    author = "nkenny";
    authorUrl = "http://www.nopryl.no";
  };
};

class CfgWeapons
{
  class LauncherCore;
  class LauncherBase_F;
  class Launch_RPG7_F : LauncherBase_F
  {
    primary = 11;
    class Single
    {
    aiDispersionCoefX = 1.7;
    aiDispersionCoefY = 2.2;
    //aiRateOfFire = 12; 
    aiRateOfFireDispersion = 10; 
    aiRateOfFireDistance = 300;
    maxRange = 400;
    maxRangeProbab = 0.4;
    midRange = 250;
    midRangeProbab = 0.8;
    minRange = 5; 
    minRangeProbab = 0.56;
    }; 
  };
}; 

class CfgAmmo
{  
  class RocketCore;
  class RocketBase;
  class R_PG7_F : RocketBase
  {
    aiAmmoUsageFlags = "64 + 128 + 256 + 512";
    airLock = 1; 
    allowAgainstInfantry = 1; 
    cost = 40;
    effectsMissile = "missile3";
  };
  class M_SPG9_HEAT : RocketBase
  {
    aiAmmoUsageFlags = "64 + 128 + 512";
    allowAgainstInfantry = 1;  
  }; 
};
 