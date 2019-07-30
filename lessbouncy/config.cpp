class CfgPatches
{
  class lambs_bouncy
  {
    units[] = {};
    weapons[] = {};
    requiredVersion = 1.82;
    requiredAddons[] = {
        "A3_Weapons_F"
    };  
    version = "1.0";
    versionStr = "1.0";
    author = "nkenny";
    authorUrl = "http://www.nopryl.no";
  };
};

class CfgAmmo {
    class SmokeShell;
    class G_40mm_Smoke: SmokeShell
    {
        simulation = "shotSmoke";
        deflectionSlowDown = 0.3;
    };
};