class CfgPatches
{
    class lambs_ace_medical
    {
        units[] = {};
        weapons[] = {};
        requiredVersion = 1.82;
        requiredAddons[] = {
			"ace_medical"
			,"cba_common"
		};
		version = "1.2";
		versionStr = "1.2";
		author = "diwako";
		authorUrl = "https://www.diwako.net/";
    };
};

class Extended_PreInit_EventHandlers {
    class lambs_medical {
        init = "call compile preprocessFileLineNumbers 'lambs_medical\functions\fn_preInit.sqf'";
    };
};

#include "ACE_Medical_Treatments.hpp"
#include "medicalMenu.hpp"
#include "cfgFunctions.hpp"
#include "cfgWeapons.hpp"