class CfgPatches
{
    class lambs_quickActions
    {
        units[] = {};
        weapons[] = {};
        requiredVersion = 1.82;
        requiredAddons[] = {
            "cba_common"
		};
		version = "1.1";
		versionStr = "1.1";
		author = "diwako";
		authorUrl = "https://www.diwako.net/";
    };
};

class Extended_PreInit_EventHandlers {
    class lambs_quickActions {
        init = "call compile preprocessFileLineNumbers 'lambs_quickActions\functions\fn_preInit.sqf'";
    };
};

class Extended_InitPost_EventHandlers {
	class Helicopter {
		init = "[(_this select 0)] call lambs_quickActions_fnc_addFastRopeAction;";
	};
};

#include "cfgFunctions.hpp"